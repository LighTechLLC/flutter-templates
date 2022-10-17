import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:triple_example/home/models/todo_hive.dart';
import 'package:triple_example/home/models/todo_ui.dart';
import 'package:triple_example/home/store/home_repository.dart';
import 'package:triple_example/home/store/home_state.dart';
import 'package:triple_example/home/store/home_store.dart';
import 'package:triple_test/triple_test.dart';

import 'home_store_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  final homeRepository = MockHomeRepository();

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

  group('HomeStoreTest', () {
    storeTest<HomeStore>(
      'Check get all todos',
      build: () {
        when(homeRepository.fetchAll()).thenAnswer((_) async => savedTodos);

        return HomeStore(homeRepository);
      },
      act: (store) => store.initializeTodos(),
      expect: () => [
        tripleLoading,
        const HomeState(todos: savedTodosUi),
        tripleLoading,
      ],
    );

    storeTest<HomeStore>(
      'Check add new todo',
      build: () {
        when(homeRepository.fetchAll()).thenAnswer(
          (_) async => hiveTodosWithAddedItem,
        );

        return HomeStore(
          homeRepository,
          state: const HomeState(todos: todoUiList),
        );
      },
      act: (store) => store.createTodo('newTodo'),
      expect: () => [const HomeState(todos: todoUiListWithAddedItem)],
    );

    storeTest<HomeStore>(
      'Check remove todo',
      build: () => HomeStore(
        homeRepository,
        state: const HomeState(todos: todoUiList),
      ),
      act: (store) => store.removeTodo(1),
      expect: () => [const HomeState(todos: todoUiListWithRemovedItem)],
    );
  });
}
