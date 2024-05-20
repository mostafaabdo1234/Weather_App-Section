import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'model/user_model.dart';

class DbHelper {
   Database? _db;
  static const String DATABASENAME = "mydatabase.db";
  static const int VERSION = 2;
  static const String EMAIL='usrName';
  static const String PASSWORD='usrPassword';
  // ignore: non_constant_identifier_names
  Future<Database> db() async {
    if(_db==null){
      final path = join(await getDatabasesPath(), DATABASENAME);
      _db=await openDatabase(path,
        version: VERSION, onCreate: _onCreate, onUpgrade: _onUpgrade);
    }
    return _db!;
  }

  _onCreate(db, version) async {
    await db.execute(
        'create table users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)');
  }

  _onUpgrade(db, oldVersion, newVersion) async {
    await db.execute('drop table users');
    await _onCreate(db, newVersion);
  }

  Future<int> signup(Users user) async {
    final Database dbclient = await db();
    return dbclient.insert('users', user.toMap());
  }

  Future<bool> signin(Users user) async {
    final Database dbclient = await db();
    var result = await dbclient.rawQuery(
        "select * from users where usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
  Future<List<Users>> getUsers() async{
    final Database dbclient = await db();
    List<Map> maps= await dbclient.query('users',columns: [EMAIL,PASSWORD]);
    List<Users> userList=[];
    for (var userss in maps) {
      userList.add(Users.fromMap(userss));
    }
    return userList;
  }
}