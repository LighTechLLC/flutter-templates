import 'package:equatable/equatable.dart';
import 'package:template_bloc/todo/models/todo_hive.dart';

class TodoUi extends Equatable {
  const TodoUi(this.key, this.name);

  factory TodoUi.fromHiveModel(int key, TodoHive todo) {
    return TodoUi(key, todo.name);
  }

  final int key;
  final String name;

  @override
  List<Object?> get props => [key, name];
}
