import 'package:template_bloc/common/env/debug_options.dart';
import 'package:template_bloc/common/logger/logger.dart';

class Config {
  const Config({
    required this.logger,
    required this.title,
    required this.debugOptions,
  });

  final Logger logger;
  final String title;
  final DebugOptions debugOptions;
}
