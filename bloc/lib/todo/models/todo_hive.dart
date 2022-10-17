import 'package:hive/hive.dart';

part 'todo_hive.g.dart';

@HiveType(typeId: 0)
class TodoHive {
  const TodoHive(this.name);

  @HiveField(0)
  final String name;
}
