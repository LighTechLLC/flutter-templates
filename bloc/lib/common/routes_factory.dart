import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template_bloc/common/di/injector.dart';
import 'package:template_bloc/common/routes.dart';
import 'package:template_bloc/todo/bloc/todo_bloc.dart';
import 'package:template_bloc/todo/bloc/todo_event.dart';
import 'package:template_bloc/todo/bloc/todo_repository.dart';
import 'package:template_bloc/todo/todo_page.dart';

class RoutesFactory {
  static String get initialRoute => Routes.home;

  Map<String, Widget Function(BuildContext)> get _routes => {
        Routes.home: (context) {
          return BlocProvider(
            create: (context) =>
                TodoBloc(getIt<TodoRepository>())..add(const TodoInitialed()),
            child: const AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: TodoPage(),
            ),
          );
        },
      };

  Route<dynamic> getGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute<dynamic>(
          settings: settings,
          builder: (context) => _routes[settings.name]!(context),
        );
    }
  }
}
