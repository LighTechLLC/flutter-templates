// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'environment_config.freezed.dart';
part 'environment_config.g.dart';

@freezed
class EnvironmentConfig with _$EnvironmentConfig {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EnvironmentConfig({
    required String baseUrl,
  }) = _EnvironmentConfig;

  factory EnvironmentConfig.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentConfigFromJson(json);
}
