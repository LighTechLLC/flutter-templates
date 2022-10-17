import 'package:template_bloc/common/env/build_type.dart';

class Environment<T> {
  Environment._({required this.config, BuildType? buildType})
      : _currentBuildType = buildType ?? BuildType.dev;

  factory Environment.instance() => _instance as Environment<T>;

  final BuildType _currentBuildType;

  T config;

  static Environment? _instance;

  static void init<T>({required BuildType? buildType, required T config}) {
    _instance ??= Environment<T>._(buildType: buildType, config: config);
  }

  bool get isDebug => _currentBuildType == BuildType.dev;

  BuildType get buildType => _currentBuildType;
}
