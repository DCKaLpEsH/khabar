import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:khabar/Data/Repository/authentication_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;

  SignupBloc({
    AuthRepository? authRepository,
  })  : _authRepository = authRepository ?? AuthRepository(),
        super(SignupInitial()) {
    on<SignupEvent>((event, emit) {});
    on<SignupWithEmailEvent>((event, emit) async {
      final response = await _authRepository.signupWithEmail(
        event.email,
        event.password,
      );
      if (response.isLeft) {
        SignupErrorState(
          error: response.left,
        );
      } else {
        SignupSuccessState();
      }
    });
    on<SignupWithGoogleEvent>((event, emit) {});
    on<SignupWithFacebookEvent>((event, emit) {});
    on<SignupWithPhoneEvent>((event, emit) {});
  }
}
