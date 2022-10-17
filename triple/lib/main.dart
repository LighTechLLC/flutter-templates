import 'package:triple_example/common/env/build_type.dart';
import 'package:triple_example/common/env/config.dart';
import 'package:triple_example/common/env/debug_options.dart';
import 'package:triple_example/common/env/environment.dart';
import 'package:triple_example/common/runner.dart';

void main() {
  Environment.init(
    buildType: BuildType.release,
    config: const Config(
      title: 'ENV Flutter application template with Triple',
      debugOptions: DebugOptions(),
    ),
  );

  run();
}
