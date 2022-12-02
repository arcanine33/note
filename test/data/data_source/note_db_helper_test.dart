import 'package:flutter_test/flutter_test.dart';
import 'package:note/data/data_source/note_db_helper.dart';
import 'package:note/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  test('db test', () async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

    final noteDbHelper = NoteDBHelper(db);

    await noteDbHelper.insertNote(Note(
      title: 'test',
      content: 'test',
      color: 1,
      timestamp: 1,
    ));

    expect((await noteDbHelper.getNotes()).length, 1);

    await db.close();
  });
}