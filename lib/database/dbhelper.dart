import 'package:budget_tracker/model/budgetmodel.dart';
import 'package:budget_tracker/model/usermodel.dart';
import 'package:sqflite/sqflite.dart';

class DBheLPer {
  static final DBheLPer _obj = DBheLPer._();

  DBheLPer._();

  final dbname = "budget2.db";
  String user = "UserData";
  String balance = "Balance";

  factory DBheLPer() {
    return _obj;
  }

  static DBheLPer get instance => _obj;

  Database? database;

  Future initDatabase() async {
    database = await openDatabase(dbname, version: 4, onCreate: (db, version) {
      db.execute('''CREATE TABLE "UserData" (
          "password" TEXT NOT NULL,
          "number" TEXT NOT NULL UNIQUE,
          "id" INTEGER NOT NULL, 
          PRIMARY KEY("id" AUTOINCREMENT))''');

      db.execute('''
      CREATE TABLE "Balance" (
	"id"	INTEGER  NOT NULL,
	"type"	TEXT NOT NULL,
	"amount"	NUMERIC NOT NULL DEFAULT 0,
	"date"	TEXT NOT NULL,
	"name"	TEXT NOT NULL,
	"note"	TEXT NOT NULL,
		
	"category"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
)
      ''');
    }, singleInstance: true);
  }

  Future insertUserData(UserModel userModel) async {
    var database = await openDatabase(dbname);

    database.insert(user, userModel.toJson()); // Removed extra comma
    database.close();
  }

  Future insertBudget(BudgetModel budgetModel) async {
    var database = await openDatabase(dbname);
    database.insert(balance, budgetModel.toJson());
    database.close();
  }

  Future deleteUserData(int id) async {
    if (database == null) await initDatabase();
    database?.delete(user, where: "id=?", whereArgs: [id]);
    database?.close();
  }

  Future<List<Map<String, Object?>>?> getUser(
      String number, String password) async {
    return database?.rawQuery(
      "select * from UserData where number=$number and password=$password",
      // [number, password]
    );
  }

  Future<List<Map<String, Object?>>?> getBalance({bool income = false}) async {
    var database = await openDatabase(dbname);
    var type = income ? 'Income' : 'Expanse';
    return await database.rawQuery("select * from Balance where type='$type'");
  }
}
