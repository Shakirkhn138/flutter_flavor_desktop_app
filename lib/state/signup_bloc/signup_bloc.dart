import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>{
  SignUpBloc () : super(SignUpState.initial()){
    on<NameChangedEvent>(name);
    on<EmailChangedEvent>(email);
    on<PasswordChangedEvent>(password);
    on<SubmitButtonEvent>(submitButton);
    on<GoogleSignUpEvent>(googleLogin);
  }

  void name (NameChangedEvent event, Emitter<SignUpState> emit){
    emit(state.copyWith(name: event.name));
  }

  void email (EmailChangedEvent event, Emitter<SignUpState> emit){
    emit(state.copyWith(email: event.email));
  }

  void password (PasswordChangedEvent event, Emitter<SignUpState> emit){
    emit(state.copyWith(password: event.password));
  }

  void submitButton (SubmitButtonEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isSubmitted: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isSubmitted: false));
  }

  void googleLogin (GoogleSignUpEvent event, Emitter<SignUpState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isLoading: false));
  }

}