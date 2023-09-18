import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';
import '../../common/failure.dart';

class SearchTheDogUseCase {
  final TheDogRepository repository;

  SearchTheDogUseCase(this.repository);

  Future<Either<Failure, List<TheDogLocal>>> execute(String name) {
    return repository.searchDogbyName(name);
  }
}
