import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoginWithPhoneEvent>((event, emit) {});
    on<LoginWithEmailEvent>((event, emit) {});
    on<LoginWithGmailEvent>((event, emit) {});
    on<LoginWithFacebookEvent>((event, emit) {});
    on<ForgotPasswordEvent>((event, emit) {});
    on<RecoverViaEmailEvent>((event, emit) {});
    on<RecoverViaPhoneEvent>((event, emit) {});
  }
}
