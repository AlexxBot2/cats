import 'package:cats/core/network/network_info.dart';
import 'package:cats/features/cat/data/datasources/cat_remote_data.dart';
import 'package:cats/features/cat/data/repository/cat_repository_impl.dart';
import 'package:cats/features/cat/domain/repository/cat_repository.dart';
import 'package:cats/features/cat/domain/usecases/cat_use_case.dart';
import 'package:cats/features/cat/presentation/bloc/cat_bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as client;

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => CatBloc(useCase: sl()));

  sl.registerLazySingleton(() => CatUseCase(repository: sl()));

  sl.registerLazySingleton<CatRepository>(() => CatRepositoryImpl(remoteData: sl(), networkInfo: sl()));

  sl.registerLazySingleton<CatRemoteData>(
    () => CatRemoteDataImpl(client: sl())
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl(), 'https://api.thecatapi.com/v1/breeds'));

  sl.registerLazySingleton(() => client.Client());
  sl.registerLazySingleton(() => Connectivity());

}