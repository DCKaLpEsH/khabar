part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupWithEmailEvent extends SignupEvent {
  final String email;

  final String password;

  const SignupWithEmailEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class SignupWithGoogleEvent extends SignupEvent {}

class SignupWithFacebookEvent extends SignupEvent {}

class SignupWithPhoneEvent extends SignupEvent {}
