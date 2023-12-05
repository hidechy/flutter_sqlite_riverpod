import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/note.dart';

import 'note_response_state.dart';

////////////////////////////////////////////////

final noteProvider = StateNotifierProvider.autoDispose<NoteNotifier, NoteResponseState>((ref) {
  return NoteNotifier(const NoteResponseState());
});

class NoteNotifier extends StateNotifier<NoteResponseState> {
  NoteNotifier(super.state);

  ///
  Future<void> setNoteList({required List<Note> noteList}) async {
    state = state.copyWith(noteList: AsyncValue.data(noteList));
  }
}

////////////////////////////////////////////////
