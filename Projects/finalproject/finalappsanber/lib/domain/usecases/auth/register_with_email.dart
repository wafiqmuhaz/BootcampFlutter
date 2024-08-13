import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/user.dart';
import 'package:finalappsanber/domain/repositories/auth_repository.dart';

class RegisterEmail {
  final AuthRepository repository;

  RegisterEmail(this.repository);

  Future<Either<Failure, User>> execute(String name, String telp, String email, String password) {
    return repository.registerWithEmail(name, telp, email, password);
  }
}
