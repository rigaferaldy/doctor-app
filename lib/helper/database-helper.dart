import 'package:chatdoctor/model/Doctor.dart';
import 'package:chatdoctor/model/base-doctor.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Helper class for SQLite operations
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'doctor_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE doctors(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT, category TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertDoctor(BaseDoctor doctor, String category) async {
    final db = await database;
    await db.insert(
      'doctors',
      {
        'name': doctor.name,
        'age': doctor.age,
        'address': doctor.address,
        'category': category,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getDoctors() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('doctors');
    return maps;
  }
}
