import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_bloc/app.dart';
import 'package:template_bloc/common/di/injector.dart';
import 'package:template_bloc/todo/models/todo_hive.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoHiveAdapter());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async => runApp(const App()),
    (object, stackTrace) {},
  );
}
