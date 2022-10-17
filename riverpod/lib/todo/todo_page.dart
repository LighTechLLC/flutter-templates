import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template_riverpod/common/ui/app_text_styles.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_provider.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_state.dart';
import 'package:flutter_template_riverpod/todo/widgets/todos.dart';

class TodoPage extends ConsumerStatefulWidget {
  const TodoPage({
    required StateNotifierProvider<TodoProvider, TodoState> provider,
    Key? key,
  })  : _provider = provider,
        super(key: key);

  final StateNotifierProvider<TodoProvider, TodoState> _provider;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends ConsumerState<TodoPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    ref.read(widget._provider.notifier).initializeTodos();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapCreate(BuildContext context) {
    if (_controller.text.isNotEmpty) {
      ref.read(widget._provider.notifier).createTodo(_controller.text);
      _controller.text = '';
    }
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Todos(todos: ref.read(widget._provider).todos)),
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
      body: SafeArea(
        child: ref.watch(widget._provider).isLoading
            ? _buildLoader()
            : _buildBody(context),
      ),
    );
  }
}
