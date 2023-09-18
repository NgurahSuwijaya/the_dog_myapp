import 'package:get_it/get_it.dart';
import 'package:the_dog_myapp/data/repositories/the_dog_repository_impl.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_dog_detail_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_dog_fav_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_dogs_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_local_dogs_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/insert_the_dog_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/post_the_dog_fav_usecase.dart';
import 'package:the_dog_myapp/domain/usecases/search_dog_usecase.dart';
import 'package:the_dog_myapp/presentation/pages/bloc/search_dog/search_dog_bloc.dart';
import 'package:the_dog_myapp/presentation/pages/bloc/the_dog_detail/the_dog_detail_bloc.dart';
import 'data/datasources/database/database_helper.dart';
import 'data/datasources/dog_local_data_source.dart';
import 'data/datasources/dog_remote_data_source.dart';
import 'presentation/pages/bloc/the_dog_fav/the_dog_fav_bloc.dart';
import 'presentation/pages/bloc/the_dogs/the_dogs_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<http.Client>(() => http.Client());

  //bloc
  locator.registerFactory(() => TheDogsBloc(locator(), locator(), locator()));
  locator.registerFactory(() => TheDogDetailBloc(locator()));
  locator.registerFactory(() => TheDogFavBloc(locator(), locator()));
  locator.registerFactory(() => SearchDogBloc(locator()));

  //usecase
  locator.registerLazySingleton(() => GetTheDogUseCase(locator()));
  locator.registerLazySingleton(() => InsertTheDogUseCase(locator()));
  locator.registerLazySingleton(() => GetTheLocaLDogUseCase(locator()));
  locator.registerLazySingleton(() => GetTheDogDetailUsecase(locator()));
  locator.registerLazySingleton(() => PostTheDogFavUseCase(locator()));
  locator.registerLazySingleton(() => GetTheDogFavUseCase(locator()));
  locator.registerLazySingleton(() => SearchTheDogUseCase(locator()));

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
