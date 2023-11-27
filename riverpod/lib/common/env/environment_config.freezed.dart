// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environment_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnvironmentConfig _$EnvironmentConfigFromJson(Map<String, dynamic> json) {
  return _EnvironmentConfig.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentConfig {
  String get baseUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnvironmentConfigCopyWith<EnvironmentConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentConfigCopyWith<$Res> {
  factory $EnvironmentConfigCopyWith(
          EnvironmentConfig value, $Res Function(EnvironmentConfig) then) =
      _$EnvironmentConfigCopyWithImpl<$Res, EnvironmentConfig>;
  @useResult
  $Res call({String baseUrl});
}

/// @nodoc
class _$EnvironmentConfigCopyWithImpl<$Res, $Val extends EnvironmentConfig>
    implements $EnvironmentConfigCopyWith<$Res> {
  _$EnvironmentConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
  }) {
    return _then(_value.copyWith(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvironmentConfigImplCopyWith<$Res>
    implements $EnvironmentConfigCopyWith<$Res> {
  factory _$$EnvironmentConfigImplCopyWith(_$EnvironmentConfigImpl value,
          $Res Function(_$EnvironmentConfigImpl) then) =
      __$$EnvironmentConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String baseUrl});
}

/// @nodoc
class __$$EnvironmentConfigImplCopyWithImpl<$Res>
    extends _$EnvironmentConfigCopyWithImpl<$Res, _$EnvironmentConfigImpl>
    implements _$$EnvironmentConfigImplCopyWith<$Res> {
  __$$EnvironmentConfigImplCopyWithImpl(_$EnvironmentConfigImpl _value,
      $Res Function(_$EnvironmentConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
  }) {
    return _then(_$EnvironmentConfigImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$EnvironmentConfigImpl implements _EnvironmentConfig {
  const _$EnvironmentConfigImpl({required this.baseUrl});

  factory _$EnvironmentConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnvironmentConfigImplFromJson(json);

  @override
  final String baseUrl;

  @override
  String toString() {
    return 'EnvironmentConfig(baseUrl: $baseUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvironmentConfigImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, baseUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvironmentConfigImplCopyWith<_$EnvironmentConfigImpl> get copyWith =>
      __$$EnvironmentConfigImplCopyWithImpl<_$EnvironmentConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvironmentConfigImplToJson(
      this,
    );
  }
}

abstract class _EnvironmentConfig implements EnvironmentConfig {
  const factory _EnvironmentConfig({required final String baseUrl}) =
      _$EnvironmentConfigImpl;

  factory _EnvironmentConfig.fromJson(Map<String, dynamic> json) =
      _$EnvironmentConfigImpl.fromJson;

  @override
  String get baseUrl;
  @override
  @JsonKey(ignore: true)
  _$$EnvironmentConfigImplCopyWith<_$EnvironmentConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
