import 'package:cats/core/errors/exceptions.dart';
import 'package:cats/core/errors/failures.dart';
import 'package:cats/core/network/network_info.dart';
import 'package:cats/features/cat/data/datasources/cat_remote_data.dart';
import 'package:cats/features/cat/data/models/cat.dart';
import 'package:cats/features/cat/domain/repository/cat_repository.dart';
import 'package:dartz/dartz.dart';

class CatRepositoryImpl extends CatRepository {
  final CatRemoteData remoteData;
  final NetworkInfo networkInfo;

  CatRepositoryImpl({required this.remoteData, required this.networkInfo});

  @override
  Future<Either<Failure, List<Cat>>> getList() async {
    if (await networkInfo.isConnected) {
      try {
        final cats = await remoteData.getList();
        return Right(cats);
      } on ApiResponseException catch (m) {
        return Left(ApiResponseFailure(message: m.message));
      } on TimeOutException {
        return Left(TimeOutFailure());
      } catch (ex) {
        return Left(ServerFailure(message: ex.toString()));
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
