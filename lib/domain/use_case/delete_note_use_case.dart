import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';

class DeleteNoteUseCase {
  NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}