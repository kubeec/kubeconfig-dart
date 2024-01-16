// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exec_env.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExecEnvCWProxy {
  ExecEnv name(String? name);

  ExecEnv value(String? value);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExecEnv(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExecEnv(...).copyWith(id: 12, name: "My name")
  /// ````
  ExecEnv call({
    String? name,
    String? value,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExecEnv.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExecEnv.copyWith.fieldName(...)`
class _$ExecEnvCWProxyImpl implements _$ExecEnvCWProxy {
  const _$ExecEnvCWProxyImpl(this._value);

  final ExecEnv _value;

  @override
  ExecEnv name(String? name) => this(name: name);

  @override
  ExecEnv value(String? value) => this(value: value);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExecEnv(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExecEnv(...).copyWith(id: 12, name: "My name")
  /// ````
  ExecEnv call({
    Object? name = const $CopyWithPlaceholder(),
    Object? value = const $CopyWithPlaceholder(),
  }) {
    return ExecEnv(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      value: value == const $CopyWithPlaceholder()
          ? _value.value
          // ignore: cast_nullable_to_non_nullable
          : value as String?,
    );
  }
}

extension $ExecEnvCopyWith on ExecEnv {
  /// Returns a callable class that can be used as follows: `instanceOfExecEnv.copyWith(...)` or like so:`instanceOfExecEnv.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExecEnvCWProxy get copyWith => _$ExecEnvCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExecEnv _$ExecEnvFromJson(Map<String, dynamic> json) => ExecEnv(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$ExecEnvToJson(ExecEnv instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('value', instance.value);
  return val;
}
