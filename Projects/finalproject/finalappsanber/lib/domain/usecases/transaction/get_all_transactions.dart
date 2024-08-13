import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/transaction.dart';
import 'package:finalappsanber/domain/repositories/transaction_repository.dart';

class GetAllTransactions {
  final TransactionRepository repository;

  GetAllTransactions(this.repository);

  Future<Either<Failure, List<TransactionEntity>>> execute() {
    return repository.getAllTransactions();
  }
}
