import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/user.dart';
import 'package:finalappsanber/domain/repositories/auth_repository.dart';

class LoginEmail {
  final AuthRepository repository;

  LoginEmail(this.repository);

  Future<Either<Failure, User>> execute(String email, String password) {
    return repository.loginWithEmail(email, password);
  }
}
