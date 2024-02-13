import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_riverpod/common/extensions/get_it_extension.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_provider.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_repository.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_state.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt
    ..registerLazySingleton(TodoRepository.new)
    ..registerBasedOnBuildType(() => TodoProvider(getIt<TodoRepository>()))
    ..registerBasedOnBuildType(
      () => StateNotifierProvider<TodoProvider, TodoState>(
        (ref) => getIt<TodoProvider>(),
      ),
    );
}
