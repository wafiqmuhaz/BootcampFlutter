import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, String>> updateCurrentUser(User user, XFile? image);
}
