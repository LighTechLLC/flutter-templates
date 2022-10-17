import 'package:equatable/equatable.dart';
import 'package:flutter_template_riverpod/todo/models/todo_ui.dart';

class TodoState extends Equatable {
  const TodoState({this.isLoading = true, this.todos = const []});

  final List<TodoUi> todos;
  final bool isLoading;

  TodoState copyWith({List<TodoUi>? todos, bool? isLoading}) {
    return TodoState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isLoading, todos];
}
