part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends AuthEvent {}

class LoadLoginStatus extends AuthEvent {}

class LogoutRequested extends AuthEvent {}

class RegisterWithEmailSubmitted extends AuthEvent {
  final String name;
  final String telp;
  final String email;
  final String password;

  const RegisterWithEmailSubmitted({
    required this.name,
    required this.telp,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [
        name,
        telp,
        email,
        password,
      ];
}

class LoginWithEmailSubmitted extends AuthEvent {
  final String email;
  final String password;

  const LoginWithEmailSubmitted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
