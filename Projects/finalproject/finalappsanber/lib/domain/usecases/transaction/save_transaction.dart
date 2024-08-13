import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/transaction.dart';
import 'package:finalappsanber/domain/repositories/transaction_repository.dart';

class SaveTransaction {
  final TransactionRepository repository;

  SaveTransaction(this.repository);

  Future<Either<Failure, void>> execute(TransactionEntity transaction) {
    return repository.saveTransaction(transaction);
  }
}
