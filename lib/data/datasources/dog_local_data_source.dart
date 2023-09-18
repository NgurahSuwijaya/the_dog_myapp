import 'package:the_dog_myapp/common/exception.dart';
import 'package:the_dog_myapp/data/models/the_dog_local.dart';
import 'package:the_dog_myapp/data/models/the_dog_model.dart';
import 'database/database_helper.dart';

abstract class TheDogLocalDataSource {
  Future<String> insertTheDogList(List<TheDogModel> theDogModel);
  Future<List<TheDogLocal>> getTheDogLocalList();
  Future<List<TheDogLocal>> searchDogbyName(String name);
}

class TheDogLocalDataSourceImpl implements TheDogLocalDataSource {
  final DatabaseHelper databaseHelper;

  TheDogLocalDataSourceImpl(this.databaseHelper);

  @override
  Future<String> insertTheDogList(List<TheDogModel> theDogModel) async {
    try {
      await databaseHelper.insertTheDogList(theDogModel);
      print('inserted to databse');
      return 'Insert to database';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<TheDogLocal>> getTheDogLocalList() async {
    try {
      final result = await databaseHelper.getLocalTheDogs();
      return result.map((e) => TheDogLocal.fromMap(e)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<List<TheDogLocal>> searchDogbyName(String name) async {
    try {
      final result = await databaseHelper.searchDogByName(name);
      return result.map((e) => TheDogLocal.fromMap(e)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
