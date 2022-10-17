import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:template_bloc/todo/bloc/todo_bloc.dart';
import 'package:template_bloc/todo/bloc/todo_event.dart';
import 'package:template_bloc/todo/bloc/todo_repository.dart';
import 'package:template_bloc/todo/bloc/todo_state.dart';
import 'package:template_bloc/todo/models/todo_hive.dart';
import 'package:template_bloc/todo/models/todo_ui.dart';

import 'todo_bloc_test.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late TodoBloc bloc;
  late MockTodoRepository todoRepository;

  const savedTodos = <dynamic, TodoHive>{0: TodoHive('todo')};
  const savedTodosUi = [TodoUi(0, 'todo')];

  const todoUiList = [TodoUi(0, 'todo0'), TodoUi(1, 'todo1')];

  const hiveListWithAddedItem = <dynamic, TodoHive>{
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

  setUp(() {
    todoRepository = MockTodoRepository();
    bloc = TodoBloc(todoRepository);
  });

  blocTest<TodoBloc, TodoState>(
    'Check getting initial todos',
    build: () {
      when(todoRepository.fetchAll()).thenAnswer((_) async => savedTodos);
      return bloc;
    },
    act: (bloc) => bloc.add(const TodoInitialed()),
    wait: const Duration(seconds: 1),
    expect: () => [
      const TodoState.update(savedTodosUi),
    ],
  );

  blocTest<TodoBloc, TodoState>(
    'Check add new todo',
    build: () {
      when(todoRepository.fetchAll())
          .thenAnswer((_) async => hiveListWithAddedItem);
      return bloc;
    },
    seed: () => const TodoState.update(todoUiList),
    act: (bloc) => bloc.add(const TodoCreated('newTodo')),
    expect: () => [const TodoState.update(todoUiListWithAddedItem)],
  );

  blocTest<TodoBloc, TodoState>(
    'Remove one todo',
    build: () => bloc,
    seed: () => const TodoState.update(todoUiList),
    act: (bloc) => bloc.add(const TodoRemoved(1)),
    expect: () => [const TodoState.update(todoUiListWithRemovedItem)],
  );
}
