import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_bloc/common/ui/app_text_styles.dart';
import 'package:template_bloc/todo/bloc/todo_bloc.dart';
import 'package:template_bloc/todo/bloc/todo_event.dart';
import 'package:template_bloc/todo/models/todo_ui.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({required TodoUi todo, Key? key})
      : _todo = todo,
        super(key: key);

  final TodoUi _todo;

  void _onTapRemove(BuildContext context) {
    context.read<TodoBloc>().add(TodoRemoved(_todo.key));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(child: Text(_todo.name, style: AppTextStyles.bold)),
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
