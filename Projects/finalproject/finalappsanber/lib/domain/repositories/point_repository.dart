import 'package:dartz/dartz.dart';

import 'package:finalappsanber/common/failure.dart';
import 'package:finalappsanber/domain/entity/point.dart';

abstract class PointRepository {
  Future<Either<Failure, List<Point>>> getAllPointsHistory();
  Future<Either<Failure, void>> savePoint(int point);
  Future<Either<Failure, void>> usePoint(int point);
}
