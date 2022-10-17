import 'package:equatable/equatable.dart';
import 'package:triple_example/home/models/todo_ui.dart';

class HomeState extends Equatable {
  const HomeState({this.todos = const []});

  final List<TodoUi> todos;

  HomeState copyWith({List<TodoUi>? todos}) {
    return HomeState(todos: todos ?? this.todos);
  }

  @override
  List<Object?> get props => [todos];
}
