import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/domain/entities/favourite.dart';

import '../../common/failure.dart';
import '../repositories/the_dog_repository.dart';

class GetTheDogFavUseCase {
  final TheDogRepository repository;

  GetTheDogFavUseCase(this.repository);

  Future<Either<Failure, List<Favourite>>> execute() {
    return repository.getDogFav();
  }
}
