import 'dart:io';

import 'package:the_dog_myapp/domain/entities/the_dog.dart';
import 'package:the_dog_myapp/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';

import '../../common/exception.dart';
import '../datasources/dog_remote_data_source.dart';

class TheDogRepositoryImpl implements TheDogRepository {
  final TheDogRemoteDataSource remoteDataSource;

  TheDogRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TheDog>>> getTheDogs() async {
    try {
      final result = await remoteDataSource.getTheDogs();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
