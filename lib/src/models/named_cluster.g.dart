// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_cluster.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NamedClusterCWProxy {
  NamedCluster name(String? name);

  NamedCluster cluster(Cluster? cluster);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NamedCluster(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NamedCluster(...).copyWith(id: 12, name: "My name")
  /// ````
  NamedCluster call({
    String? name,
    Cluster? cluster,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNamedCluster.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNamedCluster.copyWith.fieldName(...)`
class _$NamedClusterCWProxyImpl implements _$NamedClusterCWProxy {
  const _$NamedClusterCWProxyImpl(this._value);

  final NamedCluster _value;

  @override
  NamedCluster name(String? name) => this(name: name);

  @override
  NamedCluster cluster(Cluster? cluster) => this(cluster: cluster);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NamedCluster(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NamedCluster(...).copyWith(id: 12, name: "My name")
  /// ````
  NamedCluster call({
    Object? name = const $CopyWithPlaceholder(),
    Object? cluster = const $CopyWithPlaceholder(),
  }) {
    return NamedCluster(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      cluster: cluster == const $CopyWithPlaceholder()
          ? _value.cluster
          // ignore: cast_nullable_to_non_nullable
          : cluster as Cluster?,
    );
  }
}

extension $NamedClusterCopyWith on NamedCluster {
  /// Returns a callable class that can be used as follows: `instanceOfNamedCluster.copyWith(...)` or like so:`instanceOfNamedCluster.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NamedClusterCWProxy get copyWith => _$NamedClusterCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamedCluster _$NamedClusterFromJson(Map<String, dynamic> json) => NamedCluster(
      name: json['name'] as String?,
      cluster: json['cluster'] == null
          ? null
          : Cluster.fromJson(json['cluster'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NamedClusterToJson(NamedCluster instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('cluster', instance.cluster);
  return val;
}
