import 'package:finalappsanber/domain/repositories/cart_repository.dart';

class ClearCart {
  final CartRepository repository;

  ClearCart(this.repository);

  Future<void> execute() {
    return repository.clearCart();
  }
}
