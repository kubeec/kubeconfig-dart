// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exec.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExecCWProxy {
  Exec command(String? command);

  Exec apiVersion(String? apiVersion);

  Exec interactiveMode(InteractiveMode? interactiveMode);

  Exec env(List<ExecEnv>? env);

  Exec args(List<String>? args);

  Exec installHint(String? installHint);

  Exec provideClusterInfo(bool? provideClusterInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Exec(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Exec(...).copyWith(id: 12, name: "My name")
  /// ````
  Exec call({
    String? command,
    String? apiVersion,
    InteractiveMode? interactiveMode,
    List<ExecEnv>? env,
    List<String>? args,
    String? installHint,
    bool? provideClusterInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExec.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExec.copyWith.fieldName(...)`
class _$ExecCWProxyImpl implements _$ExecCWProxy {
  const _$ExecCWProxyImpl(this._value);

  final Exec _value;

  @override
  Exec command(String? command) => this(command: command);

  @override
  Exec apiVersion(String? apiVersion) => this(apiVersion: apiVersion);

  @override
  Exec interactiveMode(InteractiveMode? interactiveMode) =>
      this(interactiveMode: interactiveMode);

  @override
  Exec env(List<ExecEnv>? env) => this(env: env);

  @override
  Exec args(List<String>? args) => this(args: args);

  @override
  Exec installHint(String? installHint) => this(installHint: installHint);

  @override
  Exec provideClusterInfo(bool? provideClusterInfo) =>
      this(provideClusterInfo: provideClusterInfo);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Exec(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Exec(...).copyWith(id: 12, name: "My name")
  /// ````
  Exec call({
    Object? command = const $CopyWithPlaceholder(),
    Object? apiVersion = const $CopyWithPlaceholder(),
    Object? interactiveMode = const $CopyWithPlaceholder(),
    Object? env = const $CopyWithPlaceholder(),
    Object? args = const $CopyWithPlaceholder(),
    Object? installHint = const $CopyWithPlaceholder(),
    Object? provideClusterInfo = const $CopyWithPlaceholder(),
  }) {
    return Exec(
      command: command == const $CopyWithPlaceholder()
          ? _value.command
          // ignore: cast_nullable_to_non_nullable
          : command as String?,
      apiVersion: apiVersion == const $CopyWithPlaceholder()
          ? _value.apiVersion
          // ignore: cast_nullable_to_non_nullable
          : apiVersion as String?,
      interactiveMode: interactiveMode == const $CopyWithPlaceholder()
          ? _value.interactiveMode
          // ignore: cast_nullable_to_non_nullable
          : interactiveMode as InteractiveMode?,
      env: env == const $CopyWithPlaceholder()
          ? _value.env
          // ignore: cast_nullable_to_non_nullable
          : env as List<ExecEnv>?,
      args: args == const $CopyWithPlaceholder()
          ? _value.args
          // ignore: cast_nullable_to_non_nullable
          : args as List<String>?,
      installHint: installHint == const $CopyWithPlaceholder()
          ? _value.installHint
          // ignore: cast_nullable_to_non_nullable
          : installHint as String?,
      provideClusterInfo: provideClusterInfo == const $CopyWithPlaceholder()
          ? _value.provideClusterInfo
          // ignore: cast_nullable_to_non_nullable
          : provideClusterInfo as bool?,
    );
  }
}

extension $ExecCopyWith on Exec {
  /// Returns a callable class that can be used as follows: `instanceOfExec.copyWith(...)` or like so:`instanceOfExec.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExecCWProxy get copyWith => _$ExecCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exec _$ExecFromJson(Map<String, dynamic> json) => Exec(
      command: json['command'] as String?,
      apiVersion: json['apiVersion'] as String?,
      interactiveMode: $enumDecodeNullable(
              _$InteractiveModeEnumMap, json['interactiveMode'],
              unknownValue: JsonKey.nullForUndefinedEnumValue) ??
          InteractiveMode.IfAvailable,
      env: (json['env'] as List<dynamic>?)
          ?.map((e) => ExecEnv.fromJson(e as Map<String, dynamic>))
          .toList(),
      args: (json['args'] as List<dynamic>?)?.map((e) => e as String).toList(),
      installHint: json['installHint'] as String?,
      provideClusterInfo: json['provideClusterInfo'] as bool?,
    );

Map<String, dynamic> _$ExecToJson(Exec instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('command', instance.command);
  writeNotNull('apiVersion', instance.apiVersion);
  writeNotNull('env', instance.env);
  writeNotNull('args', instance.args);
  writeNotNull('installHint', instance.installHint);
  writeNotNull(
      'interactiveMode', _$InteractiveModeEnumMap[instance.interactiveMode]);
  writeNotNull('provideClusterInfo', instance.provideClusterInfo);
  return val;
}

const _$InteractiveModeEnumMap = {
  InteractiveMode.Always: 'Always',
  InteractiveMode.IfAvailable: 'IfAvailable',
  InteractiveMode.Never: 'Never',
};
