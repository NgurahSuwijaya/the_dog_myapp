import 'package:get_it/get_it.dart';
import 'package:the_dog_myapp/data/repositories/the_dog_repository_impl.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';
import 'package:the_dog_myapp/domain/usecases/get_the_dogs_usecase.dart';
import 'data/datasources/dog_remote_data_source.dart';
import 'presentation/pages/bloc/the_dogs/the_dogs_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<http.Client>(() => http.Client());

  locator.registerFactory(() => TheDogsBloc(locator()));

  locator.registerLazySingleton(() => GetTheDogUseCase(locator()));

  locator.registerLazySingleton<TheDogRepository>(
      () => TheDogRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<TheDogRemoteDataSource>(
      () => TheDogRemoteDataSourceImpl(client: locator()));
}
