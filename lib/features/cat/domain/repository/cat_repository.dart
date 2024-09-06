import 'package:cats/core/errors/failures.dart';
import 'package:cats/features/cat/data/models/cat.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, List<Cat>>> getList();
}