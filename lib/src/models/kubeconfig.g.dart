// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kubeconfig.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KubeconfigCWProxy {
  Kubeconfig clusters(List<NamedCluster>? clusters);

  Kubeconfig contexts(List<NamedContext>? contexts);

  Kubeconfig authInfos(List<NamedAuthInfo>? authInfos);

  Kubeconfig apiVersion(String? apiVersion);

  Kubeconfig currentContext(String? currentContext);

  Kubeconfig kind(String? kind);

  Kubeconfig preferences(Preferences? preferences);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Kubeconfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Kubeconfig(...).copyWith(id: 12, name: "My name")
  /// ````
  Kubeconfig call({
    List<NamedCluster>? clusters,
    List<NamedContext>? contexts,
    List<NamedAuthInfo>? authInfos,
    String? apiVersion,
    String? currentContext,
    String? kind,
    Preferences? preferences,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfKubeconfig.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfKubeconfig.copyWith.fieldName(...)`
class _$KubeconfigCWProxyImpl implements _$KubeconfigCWProxy {
  const _$KubeconfigCWProxyImpl(this._value);

  final Kubeconfig _value;

  @override
  Kubeconfig clusters(List<NamedCluster>? clusters) => this(clusters: clusters);

  @override
  Kubeconfig contexts(List<NamedContext>? contexts) => this(contexts: contexts);

  @override
  Kubeconfig authInfos(List<NamedAuthInfo>? authInfos) =>
      this(authInfos: authInfos);

  @override
  Kubeconfig apiVersion(String? apiVersion) => this(apiVersion: apiVersion);

  @override
  Kubeconfig currentContext(String? currentContext) =>
      this(currentContext: currentContext);

  @override
  Kubeconfig kind(String? kind) => this(kind: kind);

  @override
  Kubeconfig preferences(Preferences? preferences) =>
      this(preferences: preferences);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Kubeconfig(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Kubeconfig(...).copyWith(id: 12, name: "My name")
  /// ````
  Kubeconfig call({
    Object? clusters = const $CopyWithPlaceholder(),
    Object? contexts = const $CopyWithPlaceholder(),
    Object? authInfos = const $CopyWithPlaceholder(),
    Object? apiVersion = const $CopyWithPlaceholder(),
    Object? currentContext = const $CopyWithPlaceholder(),
    Object? kind = const $CopyWithPlaceholder(),
    Object? preferences = const $CopyWithPlaceholder(),
  }) {
    return Kubeconfig(
      clusters: clusters == const $CopyWithPlaceholder()
          ? _value.clusters
          // ignore: cast_nullable_to_non_nullable
          : clusters as List<NamedCluster>?,
      contexts: contexts == const $CopyWithPlaceholder()
          ? _value.contexts
          // ignore: cast_nullable_to_non_nullable
          : contexts as List<NamedContext>?,
      authInfos: authInfos == const $CopyWithPlaceholder()
          ? _value.authInfos
          // ignore: cast_nullable_to_non_nullable
          : authInfos as List<NamedAuthInfo>?,
      apiVersion: apiVersion == const $CopyWithPlaceholder()
          ? _value.apiVersion
          // ignore: cast_nullable_to_non_nullable
          : apiVersion as String?,
      currentContext: currentContext == const $CopyWithPlaceholder()
          ? _value.currentContext
          // ignore: cast_nullable_to_non_nullable
          : currentContext as String?,
      kind: kind == const $CopyWithPlaceholder()
          ? _value.kind
          // ignore: cast_nullable_to_non_nullable
          : kind as String?,
      preferences: preferences == const $CopyWithPlaceholder()
          ? _value.preferences
          // ignore: cast_nullable_to_non_nullable
          : preferences as Preferences?,
    );
  }
}

extension $KubeconfigCopyWith on Kubeconfig {
  /// Returns a callable class that can be used as follows: `instanceOfKubeconfig.copyWith(...)` or like so:`instanceOfKubeconfig.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KubeconfigCWProxy get copyWith => _$KubeconfigCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Kubeconfig _$KubeconfigFromJson(Map<String, dynamic> json) => Kubeconfig(
      clusters: (json['clusters'] as List<dynamic>?)
          ?.map((e) => NamedCluster.fromJson(e as Map<String, dynamic>))
          .toList(),
      contexts: (json['contexts'] as List<dynamic>?)
          ?.map((e) => NamedContext.fromJson(e as Map<String, dynamic>))
          .toList(),
      authInfos: (json['users'] as List<dynamic>?)
          ?.map((e) => NamedAuthInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      apiVersion: json['apiVersion'] as String? ?? 'v1',
      currentContext: json['current-context'] as String?,
      kind: json['kind'] as String? ?? 'Config',
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$KubeconfigToJson(Kubeconfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('apiVersion', instance.apiVersion);
  writeNotNull('clusters', instance.clusters);
  writeNotNull('contexts', instance.contexts);
  writeNotNull('current-context', instance.currentContext);
  writeNotNull('kind', instance.kind);
  writeNotNull('preferences', instance.preferences);
  writeNotNull('users', instance.authInfos);
  return val;
}
