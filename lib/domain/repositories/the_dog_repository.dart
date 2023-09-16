import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/common/failure.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';
import 'package:the_dog_myapp/domain/entities/the_dog.dart';

abstract class TheDogRepository {
  Future<Either<Failure, List<TheDog>>> getTheDogs();
  Future<Either<Failure, String>> insertTheDog(List<TheDog> dogs);
  Future<Either<Failure, List<TheDogLocal>>> getTheDogLocal();
}
