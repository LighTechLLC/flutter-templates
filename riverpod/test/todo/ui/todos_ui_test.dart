import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template_riverpod/todo/models/todo_ui.dart';
import 'package:flutter_template_riverpod/todo/widgets/todos.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Check display empty message', (tester) async {
    late final String message;
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(100, 300),
        builder: (context, child) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: const Locale('en'),
          builder: (context, child) {
            message = AppLocalizations.of(context)!.emptyTodos;
            return child!;
          },
          home: const Todos(todos: []),
        ),
      ),
    );

    expect(find.text(message), findsOneWidget);
  });

  testWidgets('Check display list', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(100, 300),
        builder: (context, child) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: const Locale('en'),
          builder: (context, child) => child!,
          home: const Todos(todos: [TodoUi(0, 'todo')]),
        ),
      ),
    );

    expect(find.text('todo'), findsOneWidget);
  });
}
