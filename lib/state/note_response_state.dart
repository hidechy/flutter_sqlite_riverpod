import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/note.dart';

part 'note_response_state.freezed.dart';

@freezed
class NoteResponseState with _$NoteResponseState {
  const factory NoteResponseState({
    @Default(AsyncValue<List<Note>>.loading()) AsyncValue<List<Note>> noteList,
  }) = _NoteResponseState;
}
