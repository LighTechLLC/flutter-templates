import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:triple_example/home/models/todo_ui.dart';
import 'package:triple_example/home/widgets/todo_list_item.dart';

class Todos extends StatelessWidget {
  const Todos(List<TodoUi> todos, {Key? key})
      : _todos = todos,
        super(key: key);

  final List<TodoUi> _todos;

  @override
  Widget build(BuildContext context) {
    return _todos.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'Todo list is empty.',
                style: TextStyle(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) => TodoListItem(_todos[index]),
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: _todos.length,
          );
  }
}
