// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_auth_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NamedAuthInfoCWProxy {
  NamedAuthInfo name(String? name);

  NamedAuthInfo user(AuthInfo? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NamedAuthInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NamedAuthInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  NamedAuthInfo call({
    String? name,
    AuthInfo? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNamedAuthInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNamedAuthInfo.copyWith.fieldName(...)`
class _$NamedAuthInfoCWProxyImpl implements _$NamedAuthInfoCWProxy {
  const _$NamedAuthInfoCWProxyImpl(this._value);

  final NamedAuthInfo _value;

  @override
  NamedAuthInfo name(String? name) => this(name: name);

  @override
  NamedAuthInfo user(AuthInfo? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NamedAuthInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NamedAuthInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  NamedAuthInfo call({
    Object? name = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return NamedAuthInfo(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as AuthInfo?,
    );
  }
}

extension $NamedAuthInfoCopyWith on NamedAuthInfo {
  /// Returns a callable class that can be used as follows: `instanceOfNamedAuthInfo.copyWith(...)` or like so:`instanceOfNamedAuthInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NamedAuthInfoCWProxy get copyWith => _$NamedAuthInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamedAuthInfo _$NamedAuthInfoFromJson(Map<String, dynamic> json) =>
    NamedAuthInfo(
      name: json['name'] as String?,
      user: json['user'] == null
          ? null
          : AuthInfo.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NamedAuthInfoToJson(NamedAuthInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('user', instance.user);
  return val;
}
