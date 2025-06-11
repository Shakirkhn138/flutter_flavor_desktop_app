part of 'login_bloc.dart';


class LoginState extends Equatable {

  final String email;
  final String password;
  final bool isRemembered;
  final bool isSubmitting;
  final bool isLoading;
  final String error;

  const LoginState ({
    required this.email,
    required this.password,
    required this.isRemembered,
    required this.isSubmitting,
    required this.isLoading,
    required this.error,
});
  
  LoginState copyWith (
      {String? email, String? password, bool? isRemembered, bool? isSubmitting,bool? isLoading ,String? error}){
    return LoginState(email: email ?? this.email, password: password ?? this.password, isRemembered: isRemembered ?? this.isRemembered, isSubmitting: isSubmitting ?? this.isSubmitting, isLoading: isLoading ?? this.isLoading ,error: error ?? this.error);
  }

  factory LoginState.initial() {
    return LoginState(
      email: '',
      password: '',
      isRemembered: false,
      isSubmitting: false,
      isLoading: false,
      error: ''
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, isRemembered, isSubmitting, isLoading,  error];

}