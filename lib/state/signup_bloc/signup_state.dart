part of 'signup_bloc.dart';

class SignUpState extends Equatable {
  final String name;
  final String email;
  final String password;
  final bool isSubmitted;
  final bool isLoading;

  const SignUpState({
    required this.name,
    required this.email,
    required this.password,
    required this.isSubmitted,
    required this.isLoading,
  });

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    bool? isSubmitted,
    bool? isLoading,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory SignUpState.initial(){
    return SignUpState(name: '', email: '', password: '', isSubmitted: false, isLoading: false);
  }

  @override
  List<Object?> get props => [name, email, password, isSubmitted, isLoading];
}
