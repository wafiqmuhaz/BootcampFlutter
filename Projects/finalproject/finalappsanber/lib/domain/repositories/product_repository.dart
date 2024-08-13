import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, String>> insertProduct(Product product);
  Future<Either<Failure, String>> updateProduct(Product product);
  Future<Either<Failure, String>> removeProduct(Product product);
}
