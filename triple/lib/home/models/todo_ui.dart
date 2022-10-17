import 'package:equatable/equatable.dart';
import 'package:triple_example/home/models/todo_hive.dart';

class TodoUi extends Equatable {
  const TodoUi(this.key, this.name);

  factory TodoUi.fromMapEntry(MapEntry<dynamic, TodoHive> e) {
    return TodoUi(e.key as int, e.value.name);
  }

  final int key;
  final String name;

  @override
  List<Object?> get props => [key, name];
}
