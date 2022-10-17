import 'package:flutter/foundation.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:triple_example/home/models/todo_hive.dart';
import 'package:triple_example/home/models/todo_ui.dart';
import 'package:triple_example/home/store/home_repository.dart';
import 'package:triple_example/home/store/home_state.dart';

class HomeStore extends StreamStore<Exception, HomeState> {
  HomeStore(this._homeRepository, {@visibleForTesting HomeState? state})
      : super(state ?? const HomeState());

  final HomeRepository _homeRepository;

  List<TodoUi> _todosFromMap(Map<dynamic, TodoHive> savedTodos) {
    return savedTodos.entries.map(TodoUi.fromMapEntry).toList();
  }

  Future<void> initializeTodos() async {
    setLoading(true);

    final savedTodos = await _homeRepository.fetchAll();
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    update(state.copyWith(todos: _todosFromMap(savedTodos)), force: true);

    setLoading(false);
  }

  Future<void> createTodo(String todo) async {
    await _homeRepository.save(TodoHive(todo));
    final savedTodos = await _homeRepository.fetchAll();
    update(state.copyWith(todos: _todosFromMap(savedTodos)));
  }

  Future<void> removeTodo(int key) async {
    await _homeRepository.removeByKey(key);
    update(state.copyWith(
      todos: List.of(state.todos)..removeWhere((element) => element.key == key),
    ));
  }
}
