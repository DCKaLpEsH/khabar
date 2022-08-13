// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupFailedState extends SignupState {}

class SignupErrorState extends SignupState {
  final SignupErrors error;
  const SignupErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}

enum SignupErrors {
  noInternet,
  emailAlreadyInUse, // email-already-in-use,
  invalidEmail, // invalid-email,
  operationNotAllowed, // operation-not-allowed,
  weakPasswowrd, // weak-password
  unknownError,
}
