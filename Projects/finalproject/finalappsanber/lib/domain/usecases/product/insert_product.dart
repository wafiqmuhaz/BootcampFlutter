import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/product.dart';
import 'package:finalappsanber/domain/repositories/product_repository.dart';

class InsertProduct {
  final ProductRepository repository;

  InsertProduct(this.repository);

  Future<Either<Failure, String>> execute(Product product) {
    return repository.insertProduct(product);
  }
}
