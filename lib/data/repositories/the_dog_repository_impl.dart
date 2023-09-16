import 'dart:io';

import 'package:the_dog_myapp/data/datasources/dog_local_data_source.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';
import 'package:the_dog_myapp/domain/entities/the_dog.dart';
import 'package:the_dog_myapp/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:the_dog_myapp/domain/repositories/the_dog_repository.dart';

import '../../common/exception.dart';
import '../datasources/dog_remote_data_source.dart';
import '../models/the_dog_model.dart';

class TheDogRepositoryImpl implements TheDogRepository {
  final TheDogRemoteDataSource remoteDataSource;
  final TheDogLocalDataSource localDataSource;

  TheDogRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

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

  @override
  Future<Either<Failure, String>> insertTheDog(List<TheDog> dogs) async {
    try {
      await localDataSource.insertTheDogList(
          (dogs.map((e) => TheDogModel.fromEntity(e)).toList()));
      return const Right('Insert operation completed');
    } on DatabaseException catch (e) {
      // print(dogs.map((e) => TheDogModel.fromEntity(e)).toList());
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TheDogLocal>>> getTheDogLocal() async {
    try {
      final result = await localDataSource.getTheDogLocalList();
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TheDog>> getTheDogDetail(String id) async {
    try {
      final result = await remoteDataSource.getTheDogDetail(id);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
