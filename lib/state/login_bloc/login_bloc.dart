import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc () : super (LoginState.initial()){
    on<EmailChangedEvent>(email);
    on<PasswordChangedEvent>(password);
    on<ToggleRememberMeEvent>(rememberMe);
    on<SubmitLoginEvent>(submitLogin);
    on<GoogleLoginEvent>(googleLogin);
  }

  void email (EmailChangedEvent event, Emitter<LoginState> emit){
    emit(state.copyWith(email: event.email));
  }

  void password (PasswordChangedEvent event, Emitter<LoginState> emit){
    emit(state.copyWith(password: event.password));
  }

  void rememberMe (ToggleRememberMeEvent event, Emitter<LoginState> emit){
    print('Toggling Remember Me from ${state.isRemembered} to ${!state.isRemembered}');

    emit(state.copyWith(isRemembered: !state.isRemembered));
  }

  void submitLogin (SubmitLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isSubmitting: true));

    await Future.delayed(const Duration(seconds: 1),(){
      emit(state.copyWith(isSubmitting: false));
    });
  }

  void googleLogin (GoogleLoginEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(Duration(seconds: 1));
    emit(state.copyWith(isLoading: false));
  }
}