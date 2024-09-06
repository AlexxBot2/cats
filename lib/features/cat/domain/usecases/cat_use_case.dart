import 'package:cats/core/errors/failures.dart';
import 'package:cats/features/cat/data/models/cat.dart';
import 'package:cats/features/cat/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase {
  Future<Either<Failure, List<Cat>>> getList();
  List<Cat> filterCatList(List<Cat> catList, String breed);
}

class CatUseCase implements UseCase {
  final CatRepository repository;

  CatUseCase({required this.repository});
  @override
  Future<Either<Failure, List<Cat>>> getList() async {
    return await repository.getList();
  }

  @override
  List<Cat> filterCatList(List<Cat> catList, String breed) {
    if (breed.trim().isEmpty) return catList;
    return catList
        .where((cat) => cat.name.toLowerCase().contains(breed.toLowerCase()))
        .toList();
  }
}
