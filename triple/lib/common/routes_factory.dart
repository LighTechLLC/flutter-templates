import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:triple_example/common/di/injector.dart';
import 'package:triple_example/common/routes.dart';
import 'package:triple_example/home/home_page.dart';
import 'package:triple_example/home/store/home_store.dart';

class RoutesFactory {
  static String get initialRoute => Routes.home;

  Map<String, Widget Function(BuildContext)> get _routes => {
        Routes.home: (context) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: HomePage(homeStore: getIt<HomeStore>()),
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
