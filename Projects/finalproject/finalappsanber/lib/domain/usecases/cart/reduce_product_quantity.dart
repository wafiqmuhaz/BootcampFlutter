import 'package:finalappsanber/domain/entity/cart.dart';
import 'package:finalappsanber/domain/entity/product.dart';
import 'package:finalappsanber/domain/repositories/cart_repository.dart';

class ReduceProductQuantity {
  final CartRepository repository;

  ReduceProductQuantity(this.repository);

  Future<Cart> execute(Product product) {
    return repository.reduceProductQuantity(product);
  }
}
