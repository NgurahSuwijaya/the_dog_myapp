import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/common/failure.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';

import '../entities/the_dog.dart';

class InsertTheDogUseCase {
  final TheDogRepository repository;

  InsertTheDogUseCase(this.repository);

  Future<Either<Failure, String>> execute(List<TheDog> dogs) {
    return repository.insertTheDog(dogs);
  }
}
