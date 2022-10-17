import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triple_example/common/di/injector.dart';
import 'package:triple_example/home/models/todo_ui.dart';
import 'package:triple_example/home/store/home_store.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem(TodoUi todo, {Key? key})
      : _todo = todo,
        super(key: key);

  final TodoUi _todo;

  void _onTapRemove(BuildContext context) {
    getIt<HomeStore>().removeTodo(_todo.key);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              _todo.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () => _onTapRemove(context),
            child: Icon(Icons.close, size: 20.w),
          ),
        ],
      ),
    );
  }
}
