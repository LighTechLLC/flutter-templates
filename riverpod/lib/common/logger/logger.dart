import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(provider, previousValue, newValue, container) {
    debugPrint('===================================================');
    debugPrint('Provider: ${provider.name ?? provider.runtimeType}');
    debugPrint('New value: ${newValue.toString()}');
  }
}
