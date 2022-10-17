import 'package:flutter_template_riverpod/common/env/debug_options.dart';

class Config {
  const Config({
    required this.title,
    required this.debugOptions,
  });

  final String title;
  final DebugOptions debugOptions;
}
