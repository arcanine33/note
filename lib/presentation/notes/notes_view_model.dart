import 'package:flutter/material.dart';
import 'package:note/domain/model/note.dart';
import 'package:note/domain/use_case/add_note_use_case.dart';
import 'package:note/domain/use_case/delete_note_use_case.dart';
import 'package:note/domain/use_case/get_notes_use_case.dart';
import 'package:note/presentation/notes/notes_event.dart';
import 'package:note/presentation/notes/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final GetNotesUseCase getNotes;
  final DeleteNoteUseCase deleteNote;
  final AddNoteUseCase addNote;
  NotesState _state = NotesState(notes: []);
  NotesState get state => _state;


  Note? _recentlyDeletedNote;

  NotesViewModel(
    this.getNotes,
    this.deleteNote,
    this.addNote,
  ) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await getNotes();
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await deleteNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();

  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}