import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class TodoInitialed extends TodoEvent {
  const TodoInitialed();
}

class TodoCreated extends TodoEvent {
  const TodoCreated(this.todo);

  final String todo;

  @override
  List<Object?> get props => [todo];
}

class TodoRemoved extends TodoEvent {
  const TodoRemoved(this.key);

  final int key;

  @override
  List<Object?> get props => [key];
}
