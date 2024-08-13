import 'package:finalappsanber/domain/entity/cart.dart';
import 'package:finalappsanber/domain/entity/product.dart';
import 'package:finalappsanber/domain/repositories/cart_repository.dart';

class AddProductToCart {
  final CartRepository repository;

  AddProductToCart(this.repository);

  Future<Cart> execute(Product product) {
    return repository.addProductToCart(product);
  }
}
