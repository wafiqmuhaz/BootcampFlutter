part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String password;
  final String fullName;
  final String username;
  final String address;
  final String aboutMe;

  const SignUpUser(this.email, this.password, this.fullName, this.username,
      this.address, this.aboutMe);

  @override
  List<Object> get props =>
      [email, password, fullName, username, address, aboutMe];
}

class SignInUser extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOut extends AuthenticationEvent {}
