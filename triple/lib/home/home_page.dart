import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:triple_example/common/ui/app_colors.dart';
import 'package:triple_example/common/ui/app_text_styles.dart';
import 'package:triple_example/home/store/home_state.dart';
import 'package:triple_example/home/store/home_store.dart';
import 'package:triple_example/home/widgets/todos.dart';

class HomePage extends StatefulWidget {
  const HomePage({required HomeStore homeStore, Key? key})
      : _homeStore = homeStore,
        super(key: key);

  final HomeStore _homeStore;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    widget._homeStore.initializeTodos();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapCreate(BuildContext context) {
    if (_controller.text.isNotEmpty) {
      widget._homeStore.createTodo(_controller.text);
      _controller.text = '';
    }
  }

  Widget _buildLoader() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildError(Exception? error) {
    return Center(child: Text('$error'));
  }

  Widget _buildBody(HomeState state) {
    return Column(
      children: [
        Expanded(child: Todos(state.todos)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.textFieldHint,
              border: const OutlineInputBorder(),
              suffixIcon: TextButton(
                onPressed: () => _onTapCreate(context),
                child: Text(
                  AppLocalizations.of(context)!.buttonText,
                  style: AppTextStyles.bold.copyWith(
                    color: AppColors.accent,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScopedBuilder<HomeStore, Exception, HomeState>.transition(
          store: widget._homeStore,
          transition: (_, child) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: child,
          ),
          onState: (context, state) => _buildBody(state),
          onError: (context, error) => _buildError(error),
          onLoading: (context) => _buildLoader(),
        ),
      ),
    );
  }
}
