import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/category.dart';
import 'package:finalappsanber/domain/repositories/category_repository.dart';

class InsertCategory {
  final CategoryRepository repository;

  InsertCategory(this.repository);

  Future<Either<Failure, String>> execute(Category category) {
    return repository.insertCategory(category);
  }
}
