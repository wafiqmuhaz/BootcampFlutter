import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/point.dart';
import 'package:finalappsanber/domain/repositories/point_repository.dart';

class GetAllPointsHistory {
  final PointRepository repository;

  GetAllPointsHistory(this.repository);

  Future<Either<Failure, List<Point>>> execute() {
    return repository.getAllPointsHistory();
  }
}
