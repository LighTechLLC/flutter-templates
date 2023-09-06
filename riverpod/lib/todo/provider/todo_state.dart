import 'package:flutter_template_riverpod/todo/models/todo_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    @Default([]) List<TodoUi> todos,
    @Default(false) bool isLoading,
  }) = _TodoState;
}
