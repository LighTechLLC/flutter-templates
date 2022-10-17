import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_riverpod/todo/models/todo_hive.dart';
import 'package:flutter_template_riverpod/todo/models/todo_ui.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_provider.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_repository.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'todo_provider_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  final todoRepository = MockTodoRepository();
  final container = ProviderContainer();

  const savedTodos = <dynamic, TodoHive>{0: TodoHive('todo')};
  const savedTodosUi = [TodoUi(0, 'todo')];

  const todoUiList = [TodoUi(0, 'todo0'), TodoUi(1, 'todo1')];
  const hiveTodosWithAddedItem = <dynamic, TodoHive>{
    0: TodoHive('todo0'),
    1: TodoHive('todo1'),
    2: TodoHive('newTodo'),
  };
  const todoUiListWithAddedItem = [
    TodoUi(0, 'todo0'),
    TodoUi(1, 'todo1'),
    TodoUi(2, 'newTodo'),
  ];
  const todoUiListWithRemovedItem = [TodoUi(0, 'todo0')];

  test('Check get all todos', () async {
    when(todoRepository.fetchAll()).thenAnswer((_) async => savedTodos);

    final provider = StateNotifierProvider<TodoProvider, TodoState>(
      (ref) => TodoProvider(todoRepository),
    );

    await container.read(provider.notifier).initializeTodos();
    await Future<void>.delayed(const Duration(seconds: 1));
    expect(container.read(provider).todos, savedTodosUi);
  });

  test('Check add new todo', () async {
    when(todoRepository.fetchAll())
        .thenAnswer((_) async => hiveTodosWithAddedItem);

    final provider = StateNotifierProvider<TodoProvider, TodoState>(
      (ref) => TodoProvider(
        todoRepository,
        state: const TodoState(todos: todoUiList, isLoading: false),
      ),
    );

    await container.read(provider.notifier).createTodo('newTodo');
    expect(container.read(provider).todos, todoUiListWithAddedItem);
  });

  test('Check remove todo', () async {
    final provider = StateNotifierProvider<TodoProvider, TodoState>(
      (ref) => TodoProvider(
        todoRepository,
        state: const TodoState(todos: todoUiList, isLoading: false),
      ),
    );

    await container.read(provider.notifier).removeTodo(1);
    expect(container.read(provider).todos, todoUiListWithRemovedItem);
  });
}
