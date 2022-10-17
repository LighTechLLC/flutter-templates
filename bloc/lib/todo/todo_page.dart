import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template_bloc/common/ui/app_text_styles.dart';
import 'package:template_bloc/todo/bloc/todo_bloc.dart';
import 'package:template_bloc/todo/bloc/todo_event.dart';
import 'package:template_bloc/todo/bloc/todo_state.dart';
import 'package:template_bloc/todo/widgets/todos.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapCreate(BuildContext context) {
    if (_controller.text.isNotEmpty) {
      context.read<TodoBloc>().add(TodoCreated(_controller.text));
      _controller.text = '';
    }
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildBody(BuildContext context, TodoState state) {
    return Column(
      children: [
        Expanded(child: Todos(todos: state.todos)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Expanded(
                child: TextField(controller: _controller),
              ),
              SizedBox(width: 8.w),
              ElevatedButton(
                onPressed: () => _onTapCreate(context),
                child: Text(
                  AppLocalizations.of(context)!.buttonText,
                  style: AppTextStyles.regular,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) => SafeArea(
          child: state.status == TodoStatus.initial
              ? _buildLoader()
              : _buildBody(context, state),
        ),
      ),
    );
  }
}
