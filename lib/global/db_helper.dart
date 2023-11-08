import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/post_data.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'your_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE posts(
        id INTEGER PRIMARY KEY,
        userId INTEGER,
        title TEXT,
        body TEXT
      )
    ''');
  }

  Future<int> insertPost(Map<String, dynamic> post) async {
    final db = await database;
    return await db.insert('posts', post);
  }

  Future<List<Map<String, dynamic>>> getPosts() async {
    final db = await database;
    return await db.query('posts');
  }
}
