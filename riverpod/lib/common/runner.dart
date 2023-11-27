import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_riverpod/common/app.dart';
import 'package:flutter_template_riverpod/common/di/injector.dart';
import 'package:flutter_template_riverpod/todo/models/todo_hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> run() async {
  await setupDependencies();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoHiveAdapter());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const App());
}
