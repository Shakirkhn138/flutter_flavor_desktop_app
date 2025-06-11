part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent ();

  @override
  List<Object> get props => [];
}

class NameChangedEvent extends SignUpEvent {
  final String name;
  const NameChangedEvent (this.name);

  @override
  List<Object> get props => [name];
}

class EmailChangedEvent extends SignUpEvent {
  final String email;
  const EmailChangedEvent (this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends SignUpEvent {
  final String password;
  const PasswordChangedEvent (this.password);

  @override
  List<Object> get props => [password];
}

class SubmitButtonEvent extends SignUpEvent {}

class GoogleSignUpEvent extends SignUpEvent {}
