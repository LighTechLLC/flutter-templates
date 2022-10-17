import 'package:flutter/material.dart';
import 'package:template_bloc/common/logger/logger.dart';

class DevLogger extends Logger {
  @override
  void e({required Object error, String? message, StackTrace? stackTrace}) {
    stackTrace ??= StackTrace.current;

    debugPrint('====================== Error log: =========================');
    if (message != null) debugPrint('Message: $message');
    debugPrint('> Error:');
    debugPrint(error.toString());
    debugPrint('> StackTrace:');
    debugPrint(stackTrace.toString());
    debugPrint('============================================================');
  }
}
