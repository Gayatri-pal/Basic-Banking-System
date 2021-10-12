import 'package:bankingapp/model/userdata.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'bank.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE userdetails(id INTEGER PRIMARY KEY, userName TEXT,cardNumber VARCHAR,cardExpiry TEXT,totalAmount DOUBLE)");
        return db;
      },
      version: 1,
    );
  }

  Future<void> insertUserDetails(UserData userdata) async {
    final Database _db = await database();
    await _db.insert('userdetails', userdata.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<UserData>> getUserDetails() async {
    final Database _db = await database();
    final List<Map<String, dynamic>> userMap = await _db.query('userdetails');
    return List.generate(
      userMap.length,
      (index) {
        return UserData(
          id: userMap[index]['id'],
          userName: userMap[index]['userName'],
          cardNumber: userMap[index]['cardNumber'],
          cardExpiry: userMap[index]['cardExpiry'],
          totalAmount: userMap[index]['totalAmount'],
        );
      },
    );
  }

  Future<List<UserData>> getUserDetailsList(int userId) async {
    final Database _db = await database();
    List<Map<String, dynamic>> userMap =
        await _db.rawQuery("SELECT * FROM userDetails WHERE id != $userId");
    return List.generate(userMap.length, (index) {
      return UserData(
        id: userMap[index]['id'],
        userName: userMap[index]['userName'],
        cardNumber: userMap[index]['cardNumber'],
        cardExpiry: userMap[index]['cardExpiry'],
        totalAmount: userMap[index]['totalAmount'],
      );
    });
  }
}