import 'package:flutter_template_riverpod/todo/models/todo_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoRepository {
  static const _boxName = 'todo_box';

  Future<Map<dynamic, TodoHive>> fetchAll() async {
    final box = await Hive.openBox<TodoHive>(_boxName);
    return box.toMap();
  }

  Future<void> save(TodoHive todo) async {
    final box = await Hive.openBox<TodoHive>(_boxName);
    await box.add(todo);
  }

  Future<void> removeByKey(int key) async {
    final box = await Hive.openBox<TodoHive>(_boxName);
    await box.delete(key);
  }
}
