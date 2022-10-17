import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template_riverpod/common/di/injector.dart';
import 'package:flutter_template_riverpod/common/routes.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_provider.dart';
import 'package:flutter_template_riverpod/todo/provider/todo_state.dart';
import 'package:flutter_template_riverpod/todo/todo_page.dart';

class RoutesFactory {
  static String get initialRoute => Routes.home;

  Map<String, Widget Function(BuildContext)> get _routes => {
        Routes.home: (context) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: TodoPage(
              provider: getIt<StateNotifierProvider<TodoProvider, TodoState>>(),
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
