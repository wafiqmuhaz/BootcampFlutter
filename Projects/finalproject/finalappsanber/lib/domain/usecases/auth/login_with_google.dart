import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/user.dart';
import 'package:finalappsanber/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository repository;

  Login(this.repository);

  Future<Either<Failure, User>> execute() {
    return repository.loginWithGoogle();
  }
}
