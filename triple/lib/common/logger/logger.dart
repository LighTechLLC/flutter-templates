import 'package:flutter/foundation.dart';
import 'package:flutter_triple/flutter_triple.dart';

class Logger {
  static void log(DispatchedTriple<Object, Object> triple) {
    debugPrint('====================== Triple log: =========================');
    debugPrint('> Store: ${triple.storeTypeName}');
    debugPrint('> State: ${triple.state}');
    debugPrint('> isLoading: ${triple.isLoading}');
    if (triple.error != null) debugPrint('Error: ${triple.error}');
    debugPrint('============================================================');
  }
}
