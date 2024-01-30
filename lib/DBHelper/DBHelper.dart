
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {

  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE product(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        subtitle TEXT,
        amount TEXT,
        discount TEXT,
        discription TEXT,
        size TEXT,
        qnty INTEGER,
        image TEXT
      )
      """);
    await database.execute("""CREATE TABLE favouriteItem(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        subtitle TEXT,
        amount TEXT,
        discription TEXT,
        image TEXT
      )
      """);
    await database.execute("""CREATE TABLE profile(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name TEXT,
        contact TEXT,
        email TEXT,
        pincode TEXT,
        city TEXT,
        state TEXT,
        image TEXT
      )
      """);
  }

// id: the id of a item
// title, discription: name and discription of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kindacode.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      //  await favouriteProduct(database);
      },
    );
  }


  // Create new item (journal)
  static Future<int> createItem(String title,String subtitle,String amount, String discount, String discription, String size,int qnty, String image) async {
    final db = await SQLHelper.db();

    final data = {'title': title,'subtitle': subtitle,'amount' : amount, 'discount': discount,'discription': discription,'size': size,'qnty': qnty,'image' : image};
    final id = await db.insert('product', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // favourite item create
  static Future<int> favouriteItem(String title,String subtitle,String amount, String discription, String image) async {
    final db = await SQLHelper.db();

    final data = {'title': title,'subtitle': subtitle,'amount' : amount ,'discription': discription,'image' : image};
    final id = await db.insert('favouriteItem', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // profile item create
  static Future<int> profileItem(String name,String contact,String email,String pincode, String city, String state, String fileImg) async {
    final db = await SQLHelper.db();

    final data = {'name': name,'contact': contact,'email' : email,'pincode':pincode ,'city': city,'state' : state, 'image': fileImg};
    final id =  db.insert('profile', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all product (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('product', orderBy: "id");
  }
  //read fvrt item
  static Future<List<Map<String, dynamic>>> getfvrtItems() async {
    final db = await SQLHelper.db();
    return db.query('favouriteItem', orderBy: "id");
  }
  //read profile item
  static Future<List<Map<String, dynamic>>> getprofileItems() async {
    final db = await SQLHelper.db();
    return db.query('profile', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('product', where: "id = ?", whereArgs: [id], limit: 1);
  }
  //read single fvrt item
  static Future<List<Map<String, dynamic>>> getfvrtItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('favouriteItem', where: "id = ?", whereArgs: [id], limit: 1);
  }
// read single profile item
  static Future<List<Map<String, dynamic>>> getprofileItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('profile', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("product", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  //delete favourite
  static Future<void> deletefvrtItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("favouriteItem", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  // delete profile
  static Future<void> deleteprofileItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("profile", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

}

