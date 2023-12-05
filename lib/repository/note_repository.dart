import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_sqlite/state/note_notifier.dart';

import '../models/note.dart';

// ignore: avoid_classes_with_only_static_members
class NoteRepository {
  static const _dbName = 'note_data.db';
  static const _tableName = 'notes';

  ///
  static Future<Database> _database() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'create table if not exists $_tableName(id integer primary key, note text, createdAt text)',
        );
      },
      version: 1,
    );

    return database;
  }

  ///
  static Future<void> insert({required Note note}) async {
    final db = await _database();
    await db.insert(_tableName, note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  ///
  // static Future<List<Note>> getNotes() async {
  //   final db = await _database();
  //
  //   final List<Map<String, dynamic>> maps = await db.query(_tableName);
  //
  //   return List.generate(maps.length, (index) {
  //     return Note(
  //       id: maps[index]['id'] as int,
  //       note: maps[index]['note'] as String,
  //       createdAt: DateTime.parse(maps[index]['createdAt']),
  //     );
  //   });
  // }

  static Future<void> getNotes({required WidgetRef ref}) async {
    final db = await _database();

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    final noteList = List.generate(maps.length, (index) {
      return Note(
        id: maps[index]['id'] as int,
        note: maps[index]['note'] as String,
        createdAt: DateTime.parse(maps[index]['createdAt']),
      );
    });

    await ref.read(noteProvider.notifier).setNoteList(noteList: noteList);
  }
}
