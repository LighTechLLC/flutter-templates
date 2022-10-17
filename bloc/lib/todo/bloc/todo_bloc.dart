import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc/todo/bloc/todo_event.dart';
import 'package:template_bloc/todo/bloc/todo_repository.dart';
import 'package:template_bloc/todo/bloc/todo_state.dart';
import 'package:template_bloc/todo/models/todo_hive.dart';
import 'package:template_bloc/todo/models/todo_ui.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(TodoRepository todoRepository)
      : _todoRepository = todoRepository,
        super(const TodoState.initial()) {
    on<TodoInitialed>(_onTodoInitialed);
    on<TodoCreated>(_onTodoCreated);
    on<TodoRemoved>(_onTodoRemoved);
  }

  final TodoRepository _todoRepository;

  Future<void> _onTodoInitialed(TodoInitialed event, Emitter emit) async {
    final savedTodos = await _todoRepository.fetchAll();
    await Future.delayed(const Duration(seconds: 1), () {
      emit(TodoState.update(
        savedTodos.entries
            .map<TodoUi>((e) => TodoUi.fromHiveModel(e.key as int, e.value))
            .toList(),
      ));
    });
  }

  Future<void> _onTodoCreated(TodoCreated event, Emitter emit) async {
    await _todoRepository.save(TodoHive(event.todo));
    final savedTodos = await _todoRepository.fetchAll();
    emit(TodoState.update(
      savedTodos.entries
          .map<TodoUi>((e) => TodoUi.fromHiveModel(e.key as int, e.value))
          .toList(),
    ));
  }

  Future<void> _onTodoRemoved(TodoRemoved event, Emitter emit) async {
    await _todoRepository.removeByKey(event.key);
    emit(TodoState.update(List.of(state.todos)
      ..removeWhere((element) => element.key == event.key)));
  }
}
