import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';

import '../../common/failure.dart';
import '../repositories/the_dog_repository.dart';

class GetTheLocaLDogUseCase {
  final TheDogRepository repository;

  GetTheLocaLDogUseCase(this.repository);

  Future<Either<Failure, List<TheDogLocal>>> execute() {
    return repository.getTheDogLocal();
  }
}
