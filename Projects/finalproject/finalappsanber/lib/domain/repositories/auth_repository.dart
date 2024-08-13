import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginWithGoogle();
  bool getLoginStatus();
  Future<String?> getRole();
  Future<void> setRole(String role);
  Future<void> logout();
  //regis
  Future<Either<Failure, User>> registerWithEmail(
      String name, String telp, String email, String password);
  Future<Either<Failure, User>> loginWithEmail(String email, String password);
}
