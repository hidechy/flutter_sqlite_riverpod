import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/note.dart';
import '../repository/note_repository.dart';
import '../state/note_notifier.dart';

// ignore: must_be_immutable
class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  TextEditingController noteController = TextEditingController();

  late BuildContext _context;
  late WidgetRef _ref;

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    Future(() => NoteRepository.getNotes(ref: ref));

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('HomeScreen'),
            TextButton(
              onPressed: showUnderMenu,
              child: const Text('note input'),
            ),
            Expanded(child: _displayNoteList()),
          ],
        ),
      ),
    );
  }

  ///
  Future<dynamic> showUnderMenu({Note? note}) async {
    if (note != null) {
      noteController.text = note.note;
    }

    return showModalBottomSheet(
      context: _context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.blueAccent.withOpacity(0.3), width: 5)),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: noteController,
                        decoration: InputDecoration(
                          hintText: 'note',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        (note != null) ? await _updateNote(note: note) : await _insertNote();

                        await NoteRepository.getNotes(ref: _ref);

                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.input),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ///
  Future<void> _insertNote() async {
    await NoteRepository.insert(
      note: Note(note: noteController.text, createdAt: DateTime.now()),
    );
  }

  ///
  Future<void> _updateNote({required Note note}) async {
    await NoteRepository.update(
      note: Note(id: note.id, note: noteController.text, createdAt: note.createdAt),
      ref: _ref,
    );

    noteController.clear();
  }

  ///
  Widget _displayNoteList() {
    final noteList = _ref.watch(noteProvider.select((value) => value.noteList));

    return noteList.when(
      data: (value) {
        final list = <Widget>[];

        value.forEach((element) {
          list.add(
            Card(
              child: ListTile(
                title: Text('${element.id}: ${element.note}'),
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => showUnderMenu(note: element),
                        child: const Icon(Icons.edit),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => NoteRepository.delete(note: element, ref: _ref),
                        child: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: list,
          ),
        );
      },
      error: (error, stackTrace) => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
