import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:triple_example/common/app.dart';
import 'package:triple_example/common/di/injector.dart';
import 'package:triple_example/common/logger/logger.dart';
import 'package:triple_example/home/models/todo_hive.dart';

Future<void> run() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoHiveAdapter());

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  TripleObserver.addListener(Logger.log);

  _runApp();
}

void _runApp() {
  runZonedGuarded<Future<void>>(
    () async => runApp(const App()),
    (object, stackTrace) {},
  );
}
