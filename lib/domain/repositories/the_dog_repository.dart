import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/common/failure.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';
import 'package:the_dog_myapp/domain/entities/favourite.dart';
import 'package:the_dog_myapp/domain/entities/response.dart';
import 'package:the_dog_myapp/domain/entities/the_dog.dart';

abstract class TheDogRepository {
  Future<Either<Failure, List<TheDog>>> getTheDogs();
  Future<Either<Failure, String>> insertTheDog(List<TheDog> dogs);
  Future<Either<Failure, List<TheDogLocal>>> getTheDogLocal();
  Future<Either<Failure, TheDog>> getTheDogDetail(String id);
  Future<Either<Failure, Response>> postTheDogFav(String id);
  Future<Either<Failure, List<Favourite>>> getDogFav();
  Future<Either<Failure, List<TheDogLocal>>> searchDogbyName(String name);
}
