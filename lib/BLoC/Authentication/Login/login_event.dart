part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithPhoneEvent extends LoginEvent {}

class LoginWithEmailEvent extends LoginEvent {
  final String email;
  final String password;
  const LoginWithEmailEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];

  @override
  bool? get stringify => false;
}

class LoginWithGmailEvent extends LoginEvent {}

class LoginWithFacebookEvent extends LoginEvent {}

class ForgotPasswordEvent extends LoginEvent {}

class RecoverViaEmailEvent extends LoginEvent {}

class RecoverViaPhoneEvent extends LoginEvent {}
