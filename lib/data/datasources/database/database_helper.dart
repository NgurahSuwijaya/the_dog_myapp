import 'package:sqflite/sqflite.dart';
import 'package:the_dog_myapp/data/models/the_dog_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tableDogList = 'theDogList';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/thedogmyapp.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);

    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE $_tableDogList (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          dog_id TEXT,
          name TEXT,
          breed_group TEXT,
          url TEXT
        )
      ''');
  }

  //insert to database
  Future<void> insertTheDogList(List<TheDogModel> dogs) async {
    final db = await database;
    var batch = db!.batch();

    print(dogs);

    for (var dog in dogs) {
      batch.insert('theDogList', {
        'dog_id': dog.id,
        'name': dog.breeds?[0].name,
        'breed_group': dog.breeds?[0].breedGroup,
        'url': dog.url,
      });
    }
    await batch.commit();
  }

  Future<List<Map<String, dynamic>>> getLocalTheDogs() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tableDogList);

    return results;
  }
}
