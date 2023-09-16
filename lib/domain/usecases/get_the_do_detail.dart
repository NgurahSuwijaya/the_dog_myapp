import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';

import '../../common/failure.dart';
import '../entities/the_dog.dart';

class GetTheDogDetail {
  final TheDogRepository repository;

  GetTheDogDetail(this.repository);

  Future<Either<Failure, TheDog>> execute(String id) {
    return repository.getTheDogDetail(id);
  }
}
