import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_riverpod/todo/models/todo_hive.dart';
import 'package:flutter_template_riverpod/todo/models/todo_ui.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_repository.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class TodoProvider extends StateNotifier<TodoState> {
  TodoProvider(this._todoRepository, {@visibleForTesting TodoState? state})
      : super(state ?? const TodoState());

  final TodoRepository _todoRepository;

  Future<void> initializeTodos() async {
    final savedTodos = await _todoRepository.fetchAll();
    await Future.delayed(const Duration(seconds: 1), () {
      state = state.copyWith(
        isLoading: false,
        todos: savedTodos.entries.map(TodoUi.fromMapEntry).toList(),
      );
    });
  }

  Future<void> createTodo(String todo) async {
    await _todoRepository.save(TodoHive(todo));
    final savedTodos = await _todoRepository.fetchAll();
    state = state.copyWith(
      todos: savedTodos.entries.map(TodoUi.fromMapEntry).toList(),
    );
  }

  Future<void> removeTodo(int key) async {
    await _todoRepository.removeByKey(key);
    state = state.copyWith(
      todos: List.of(state.todos)..removeWhere((element) => element.key == key),
    );
  }
}
