import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template_riverpod/common/ui/app_text_styles.dart';
import 'package:flutter_template_riverpod/todo/models/todo_ui.dart';
import 'package:flutter_template_riverpod/todo/widgets/todo_list_item.dart';

class Todos extends StatelessWidget {
  const Todos({required List<TodoUi> todos, super.key}) : _todos = todos;

  final List<TodoUi> _todos;

  @override
  Widget build(BuildContext context) {
    return _todos.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                AppLocalizations.of(context)!.emptyTodos,
                style: AppTextStyles.regular.copyWith(fontSize: 20.sp),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) => TodoListItem(todo: _todos[index]),
            separatorBuilder: (context, index) => SizedBox(height: 8.h),
            itemCount: _todos.length,
          );
  }
}
