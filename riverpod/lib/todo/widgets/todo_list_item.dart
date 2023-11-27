import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template_riverpod/common/di/injector.dart';
import 'package:flutter_template_riverpod/common/ui/app_text_styles.dart';
import 'package:flutter_template_riverpod/todo/models/todo_ui.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_provider.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_state.dart';

class TodoListItem extends ConsumerWidget {
  const TodoListItem({required TodoUi todo, super.key}) : _todo = todo;

  final TodoUi _todo;

  void _onTapRemove(BuildContext context, WidgetRef ref) {
    final provider = getIt<StateNotifierProvider<TodoProvider, TodoState>>();
    ref.read(provider.notifier).removeTodo(_todo.key);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(child: Text(_todo.name, style: AppTextStyles.bold)),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () => _onTapRemove(context, ref),
            child: Icon(Icons.close, size: 20.w),
          ),
        ],
      ),
    );
  }
}
