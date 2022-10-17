import 'package:template_bloc/common/env/build_type.dart';
import 'package:template_bloc/common/env/config.dart';
import 'package:template_bloc/common/env/debug_options.dart';
import 'package:template_bloc/common/env/environment.dart';
import 'package:template_bloc/common/logger/production_logger.dart';
import 'package:template_bloc/common/runner.dart';

void main() {
  Environment.init(
    buildType: BuildType.release,
    config: Config(
      logger: ProductionLogger(),
      title: 'ENV Flutter application template with Bloc state manager',
      debugOptions: const DebugOptions(),
    ),
  );

  run();
}
