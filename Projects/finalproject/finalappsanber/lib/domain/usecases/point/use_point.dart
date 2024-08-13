import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/repositories/point_repository.dart';

class UsePoint {
  final PointRepository repository;

  UsePoint(this.repository);

  Future<Either<Failure, void>> execute(int point) {
    return repository.usePoint(point);
  }
}
