import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/common/failure.dart';
import 'package:the_dog_myapp/domain/entities/the_dog.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';

class GetTheDogUseCase {
  final TheDogRepository repository;

  GetTheDogUseCase(this.repository);

  Future<Either<Failure, List<TheDog>>> execute() {
    return repository.getTheDogs();
  }
}
