import 'package:equatable/equatable.dart';

import 'package:finalappsanber/domain/entity/cart.dart';
import 'package:finalappsanber/domain/entity/user.dart';

class TransactionEntity extends Equatable {
  final User user;
  final Cart cart;
  final int usePoint;
  final int endTotalPrice;
  final String paymentMethod;
  final String paymentBankMethod;
  final DateTime createdAt;

  const TransactionEntity({
    required this.user,
    required this.cart,
    required this.usePoint,
    required this.endTotalPrice,
    required this.paymentMethod,
    required this.paymentBankMethod,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        user,
        cart,
        usePoint,
        endTotalPrice,
        paymentMethod,
        paymentBankMethod,
        createdAt,
      ];
}
