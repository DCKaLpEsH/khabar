// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../BLoC/Authentication/Signup/signup_bloc.dart';

class AuthRepository {
  final FirebaseAuth _auth;
  AuthRepository({
    FirebaseAuth? auth,
  }) : _auth = auth ?? FirebaseAuth.instance;

  Future<Either<SignupErrors, User>> signupWithEmail(
      String email, String password) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        return Right(response.user!);
      } else {
        return const Left(
          SignupErrors.unknownError,
        );
      }
    } on SocketException {
      return const Left(
        SignupErrors.noInternet,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        return const Left(
          SignupErrors.emailAlreadyInUse,
        );
      } else if (e.code == "invalid-email") {
        return const Left(
          SignupErrors.invalidEmail,
        );
      } else if (e.code == "operation-not-allowed") {
        return const Left(
          SignupErrors.operationNotAllowed,
        );
      } else if (e.code == "weak-password") {
        return const Left(
          SignupErrors.weakPasswowrd,
        );
      } else {
        return const Left(
          SignupErrors.unknownError,
        );
      }
    }
  }
}
