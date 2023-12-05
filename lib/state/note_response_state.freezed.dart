// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteResponseState {
  AsyncValue<List<Note>> get noteList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteResponseStateCopyWith<NoteResponseState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteResponseStateCopyWith<$Res> {
  factory $NoteResponseStateCopyWith(
          NoteResponseState value, $Res Function(NoteResponseState) then) =
      _$NoteResponseStateCopyWithImpl<$Res, NoteResponseState>;
  @useResult
  $Res call({AsyncValue<List<Note>> noteList});
}

/// @nodoc
class _$NoteResponseStateCopyWithImpl<$Res, $Val extends NoteResponseState>
    implements $NoteResponseStateCopyWith<$Res> {
  _$NoteResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteList = null,
  }) {
    return _then(_value.copyWith(
      noteList: null == noteList
          ? _value.noteList
          : noteList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Note>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NoteResponseStateImplCopyWith<$Res>
    implements $NoteResponseStateCopyWith<$Res> {
  factory _$$NoteResponseStateImplCopyWith(_$NoteResponseStateImpl value,
          $Res Function(_$NoteResponseStateImpl) then) =
      __$$NoteResponseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<Note>> noteList});
}

/// @nodoc
class __$$NoteResponseStateImplCopyWithImpl<$Res>
    extends _$NoteResponseStateCopyWithImpl<$Res, _$NoteResponseStateImpl>
    implements _$$NoteResponseStateImplCopyWith<$Res> {
  __$$NoteResponseStateImplCopyWithImpl(_$NoteResponseStateImpl _value,
      $Res Function(_$NoteResponseStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? noteList = null,
  }) {
    return _then(_$NoteResponseStateImpl(
      noteList: null == noteList
          ? _value.noteList
          : noteList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Note>>,
    ));
  }
}

/// @nodoc

class _$NoteResponseStateImpl implements _NoteResponseState {
  const _$NoteResponseStateImpl(
      {this.noteList = const AsyncValue<List<Note>>.loading()});

  @override
  @JsonKey()
  final AsyncValue<List<Note>> noteList;

  @override
  String toString() {
    return 'NoteResponseState(noteList: $noteList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoteResponseStateImpl &&
            (identical(other.noteList, noteList) ||
                other.noteList == noteList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noteList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoteResponseStateImplCopyWith<_$NoteResponseStateImpl> get copyWith =>
      __$$NoteResponseStateImplCopyWithImpl<_$NoteResponseStateImpl>(
          this, _$identity);
}

abstract class _NoteResponseState implements NoteResponseState {
  const factory _NoteResponseState({final AsyncValue<List<Note>> noteList}) =
      _$NoteResponseStateImpl;

  @override
  AsyncValue<List<Note>> get noteList;
  @override
  @JsonKey(ignore: true)
  _$$NoteResponseStateImplCopyWith<_$NoteResponseStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
