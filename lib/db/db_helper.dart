import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '/models/task.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('not null db');
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'task.db';
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          await db.execute('CREAT TABLE $_tableName ('
              'id INTEGER PRIMARY KEY AUTOINCREMENT,'
              'title STRING, note TEXT, date STRING,'
              'startTime STRING, repeat STRING ,'
              'color INTEGER,'
              'isCompleted INTEGER)');
        });
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert function called');
    return await _db!.insert(_tableName, task!.toJason());
  }

  static Future<int> delete(Task task) async {
    print('insert function called');
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<List<Map<String, dynamic>>> query(Task? task) async {
    print('insert function called');
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    print('update function called');
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompelted=?
    WHERE id=?
    ''', [1, id]);
  }
}
