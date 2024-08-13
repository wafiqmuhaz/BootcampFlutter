import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/repositories/point_repository.dart';

class SavePoint {
  final PointRepository repository;

  SavePoint(this.repository);

  Future<Either<Failure, void>> execute(int point) {
    return repository.savePoint(point);
  }
}
