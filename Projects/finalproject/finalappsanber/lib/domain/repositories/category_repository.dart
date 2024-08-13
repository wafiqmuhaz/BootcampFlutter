import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, String>> insertCategory(Category category);
  Future<Either<Failure, String>> updateCategory(Category category);
  Future<Either<Failure, String>> removeCategory(Category category);
}
