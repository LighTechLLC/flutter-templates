import 'package:get_it/get_it.dart';
import 'package:template_bloc/todo/bloc/todo_repository.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerSingleton(TodoRepository());
}
