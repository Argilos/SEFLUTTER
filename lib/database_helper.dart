import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  DatabaseHelper._privateConstructor();

  factory DatabaseHelper() {
    return instance;
  }

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'my_database.db');
    return await openDatabase(
      dbPath,
      version: 2, // Specify the database version
      onCreate: _createDatabase,
      onUpgrade: _onUpgradeDatabase,
    );
  }

  void _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        password TEXT,
        uniqueId TEXT,
        membershipCountdown INTEGER
      )
    ''');
  }

  void _onUpgradeDatabase(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE users ADD COLUMN lastname TEXT');
    }
  }

  Future<void> insertUser(User user) async {
    final Database db = await database;
    await db.insert('users', user.toMap());
  }

  Future<User?> getUserByEmail(String email) async {
    final Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}

class User {
  String name;
  String lastname;
  String email;
  String password;
  String uniqueId;
  int membershipCountdown;

  User({
    required this.name,
    required this.lastname,
    required this.email,
    required this.password,
    required this.uniqueId,
    required this.membershipCountdown,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password,
      'uniqueId': uniqueId,
      'membershipCountdown': membershipCountdown,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'],
      lastname: map['lastname'],
      email: map['email'],
      password: map['password'],
      uniqueId: map['uniqueId'],
      membershipCountdown: map['membershipCountdown'],
    );
  }
}

String generateUniqueId() {
  // Generate a unique ID here (implementation details omitted)
  return 'unique_id';
}
