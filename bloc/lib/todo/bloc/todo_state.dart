import 'package:equatable/equatable.dart';
import 'package:template_bloc/todo/models/todo_ui.dart';

class TodoState extends Equatable {
  const TodoState._({required this.status, required this.todos});

  const TodoState.initial()
      : this._(status: TodoStatus.initial, todos: const []);

  const TodoState.update(List<TodoUi> todos)
      : this._(status: TodoStatus.update, todos: todos);

  final TodoStatus status;
  final List<TodoUi> todos;

  @override
  List<Object?> get props => [status, todos];
}

enum TodoStatus { initial, update }
