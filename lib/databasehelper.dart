import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {

  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 2;

  static final table = 'login';
  static final table2= 'Caloriestable';
  static final table3='Diseasetable';

  static final columnId = '_id';
  static final columnName = 'Name';
  static final password = 'password';
  static final columnemail='Email';
  static final columnwater='Water';
  static final columndisease='Diseases';
  static final columncalories='Calories';
  static final columnfoodrestrict='restrictedfoods';


  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $password TEXT NOT NULL,
        $columnemail TEXT NOT NULL,
         $columnwater INTEGER NOT NULL,
        $columndisease TEXT NOT NULL
      )
    ''');


    await db.execute('''
      CREATE TABLE $table2 (
        $columnId INTEGER PRIMARY KEY,
        $columnName TEXT NOT NULL,
        $columncalories INTEGER NOT NULL
        
      )
    ''');

    await db.execute('''
      CREATE TABLE $table3 (
        $columndisease TEXT NOT NULL,
        $columnfoodrestrict INTEGER NOT NULL
        
      )
    ''');
  }






  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }





//The data present in the table is returned as a List of Map, where each
// row is of type map
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> queryAllRows2() async {
    Database db = await instance.database;
    return await db.query(table2);
  }

  Future<List<Map<String, dynamic>>> queryAllRows3() async {
    Database db = await instance.database;
    return await db.query(table3);
  }
  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }


  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<Map<String, dynamic>> checkEntryExists(String name) async {
    // Open the database
    Database db = await instance.database;

    // Query the database for the entry
    List<Map<String, dynamic>> result = await db.query(
      table,
      where: '$columnName = ?',
      whereArgs: [name],
      limit: 1,
    );

    // If the entry exists, return the ID and the existence status
    if (result.isNotEmpty) {
      int id = result.first[columnId];
      return {'exists': true, 'id': id};
    }

    // If the entry does not exist, return the existence status only
    return {'exists': false};
  }

  Future<int> getWaterLevelById(int id) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> result = await db.query(
      table,
      columns: [columnwater],
      where: '$columnId = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (result.isNotEmpty) {
      return result.first[columnwater];
    } else {
      return null;
    }
  }


  Future<int> updateWater(int id, int newWater) async {
    Database db = await instance.database;
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columnwater: newWater,
    };
    return await db.update(
      DatabaseHelper.table,
      row,
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [id],
    );
  }

  Future<int> updatedisease(int id, String disease) async {
    Database db = await instance.database;
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: id,
      DatabaseHelper.columndisease: disease,
    };
    return await db.update(
      DatabaseHelper.table,
      row,
      where: '${DatabaseHelper.columnId} = ?',
      whereArgs: [id],
    );
  }





Future<bool> checkpasswordExists(String pass ) async {
  // Open the database
  Database db = await  instance.database;


  // Query the database for the entry
  List<Map<String, dynamic>> result = await db.query(
    table,
    where: '$password = ?',
    whereArgs: [pass],
    limit: 1,
  );


  // Return true if the entry exists, false otherwise
  return result.isNotEmpty;
}
  Future<void> insertAllIntoTable(List<Map<String, dynamic>> rows) async {
    Database db = await instance.database;

    Batch batch = db.batch();
    for (var row in rows) {
      batch.insert(table2, row);
    }

    await batch.commit();
  }
  Future<int> getCaloriesByName(String name) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query(
      table2,
      where: "${DatabaseHelper.columnName} = ?",
      whereArgs: [name],
      columns: [DatabaseHelper.columncalories],
    );
    if (maps.isNotEmpty) {
      return maps.first[DatabaseHelper.columncalories];
    } else {
      return null;
    }
  }
  Future<void> insertAllIntoTabledisease(List<Map<String, dynamic>> rows) async {
    Database db = await instance.database;

    Batch batch = db.batch();
    for (var row in rows) {
      batch.insert(table3, row);
    }

    await batch.commit();
  }
  Future<String> getRestrictedFoods(String diseaseName) async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query(
      table3,
      columns: [columnfoodrestrict],
      where: '$columndisease = ?',
      whereArgs: [diseaseName],
    );

    Set<String> restrictedFoods = {}; // Use a Set to store unique values

    for (var row in result) {
      restrictedFoods.add(row[columnfoodrestrict].toString());
    }

    return restrictedFoods.join(", ");
  }



}


