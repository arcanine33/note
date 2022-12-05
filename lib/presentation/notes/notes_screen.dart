import 'package:flutter/material.dart';
import 'package:note/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:note/presentation/notes/notes_event.dart';
import 'package:note/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';

import 'components/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your note'),
        titleTextStyle: const TextStyle(fontSize: 30),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.sort))
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView (
          children: state.notes.map((note) => NoteItem(note: note)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEditNoteScreen()),
          );
          if (isSaved != null && isSaved) {
            viewModel.onEvent(NotesEvent.loadNotes());
          }

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
