import 'package:flutter_template_riverpod/common/env/build_type.dart';
import 'package:flutter_template_riverpod/common/env/config.dart';
import 'package:flutter_template_riverpod/common/env/debug_options.dart';
import 'package:flutter_template_riverpod/common/env/environment.dart';
import 'package:flutter_template_riverpod/common/runner.dart';

void main() {
  Environment.init(
    buildType: BuildType.stage,
    config: const Config(
      title: 'ENV Flutter application template with Riverpod',
      debugOptions: DebugOptions(),
    ),
  );

  run();
}
