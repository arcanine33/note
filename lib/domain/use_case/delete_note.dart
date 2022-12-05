import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';

class DeleteNote {
  NoteRepository repository;

  DeleteNote(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}