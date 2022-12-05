import 'package:note/domain/model/note.dart';
import 'package:note/domain/repository/note_repository.dart';
import 'package:note/domain/util/note_order.dart';

class GetNotesUseCase {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);

  Future<List<Note>> call(NoteOrder noteOrder) async {
    List<Note> notes = await repository.getNotes();
    noteOrder.when(
      title: (orderType) {},
      date: (orderType) {
        orderType.when(
            ascending: () {},
            descending: () {
              notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
            });
      },
      color: (orderType) {},
    );

    return notes;
  }
}