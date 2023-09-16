import 'package:get_it/get_it.dart';
import 'package:the_dog_myapp/data/repositories/the_dog_repository_impl.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_dogs_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_local_dogs_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/insert_the_dog_usecase.dart';
import 'data/datasources/database/database_helper.dart';
import 'data/datasources/dog_local_data_source.dart';
import 'data/datasources/dog_remote_data_source.dart';
import 'presentation/pages/bloc/the_dogs/the_dogs_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<http.Client>(() => http.Client());

  //bloc
  locator.registerFactory(() => TheDogsBloc(locator(), locator(), locator()));

  //usecase
  locator.registerLazySingleton(() => GetTheDogUseCase(locator()));
  locator.registerLazySingleton(() => InsertTheDogUseCase(locator()));
  locator.registerLazySingleton(() => GetTheLocaLDogUseCase(locator()));

  //repository
  locator.registerLazySingleton<TheDogRepository>(() => TheDogRepositoryImpl(
      remoteDataSource: locator(), localDataSource: locator()));

  //datasource
  locator.registerLazySingleton<TheDogRemoteDataSource>(
      () => TheDogRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TheDogLocalDataSource>(
      () => TheDogLocalDataSourceImpl(locator()));

  //other
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
}
