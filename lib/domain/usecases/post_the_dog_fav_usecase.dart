import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/common/failure.dart';
import 'package:the_dog_myapp/domain/entities/response.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';

class PostTheDogFavUseCase {
  final TheDogRepository repository;

  PostTheDogFavUseCase(this.repository);

  Future<Either<Failure, Response>> execute({required String id}) {
    return repository.postTheDogFav(id);
  }
}
