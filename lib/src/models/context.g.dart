// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'context.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ContextCWProxy {
  Context cluster(String? cluster);

  Context authInfo(String? authInfo);

  Context namespace(String? namespace);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Context(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Context(...).copyWith(id: 12, name: "My name")
  /// ````
  Context call({
    String? cluster,
    String? authInfo,
    String? namespace,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfContext.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfContext.copyWith.fieldName(...)`
class _$ContextCWProxyImpl implements _$ContextCWProxy {
  const _$ContextCWProxyImpl(this._value);

  final Context _value;

  @override
  Context cluster(String? cluster) => this(cluster: cluster);

  @override
  Context authInfo(String? authInfo) => this(authInfo: authInfo);

  @override
  Context namespace(String? namespace) => this(namespace: namespace);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Context(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Context(...).copyWith(id: 12, name: "My name")
  /// ````
  Context call({
    Object? cluster = const $CopyWithPlaceholder(),
    Object? authInfo = const $CopyWithPlaceholder(),
    Object? namespace = const $CopyWithPlaceholder(),
  }) {
    return Context(
      cluster: cluster == const $CopyWithPlaceholder()
          ? _value.cluster
          // ignore: cast_nullable_to_non_nullable
          : cluster as String?,
      authInfo: authInfo == const $CopyWithPlaceholder()
          ? _value.authInfo
          // ignore: cast_nullable_to_non_nullable
          : authInfo as String?,
      namespace: namespace == const $CopyWithPlaceholder()
          ? _value.namespace
          // ignore: cast_nullable_to_non_nullable
          : namespace as String?,
    );
  }
}

extension $ContextCopyWith on Context {
  /// Returns a callable class that can be used as follows: `instanceOfContext.copyWith(...)` or like so:`instanceOfContext.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ContextCWProxy get copyWith => _$ContextCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Context _$ContextFromJson(Map<String, dynamic> json) => Context(
      cluster: json['cluster'] as String?,
      authInfo: json['user'] as String?,
      namespace: json['namespace'] as String?,
    );

Map<String, dynamic> _$ContextToJson(Context instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cluster', instance.cluster);
  writeNotNull('namespace', instance.namespace);
  writeNotNull('user', instance.authInfo);
  return val;
}
