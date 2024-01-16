// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider_config.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthProviderConfigCWProxy {
  AuthProviderConfig name(String? name);

  AuthProviderConfig config(Map<String, String>? config);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthProviderConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthProviderConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthProviderConfig call({
    String? name,
    Map<String, String>? config,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthProviderConfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthProviderConfig.copyWith.fieldName(...)`
class _$AuthProviderConfigCWProxyImpl implements _$AuthProviderConfigCWProxy {
  const _$AuthProviderConfigCWProxyImpl(this._value);

  final AuthProviderConfig _value;

  @override
  AuthProviderConfig name(String? name) => this(name: name);

  @override
  AuthProviderConfig config(Map<String, String>? config) =>
      this(config: config);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthProviderConfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthProviderConfig(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthProviderConfig call({
    Object? name = const $CopyWithPlaceholder(),
    Object? config = const $CopyWithPlaceholder(),
  }) {
    return AuthProviderConfig(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      config: config == const $CopyWithPlaceholder()
          ? _value.config
          // ignore: cast_nullable_to_non_nullable
          : config as Map<String, String>?,
    );
  }
}

extension $AuthProviderConfigCopyWith on AuthProviderConfig {
  /// Returns a callable class that can be used as follows: `instanceOfAuthProviderConfig.copyWith(...)` or like so:`instanceOfAuthProviderConfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthProviderConfigCWProxy get copyWith =>
      _$AuthProviderConfigCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthProviderConfig _$AuthProviderConfigFromJson(Map<String, dynamic> json) =>
    AuthProviderConfig(
      name: json['name'] as String?,
      config: (json['config'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$AuthProviderConfigToJson(AuthProviderConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('config', instance.config);
  return val;
}
