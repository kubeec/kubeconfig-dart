import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kubeconfig/src/models/cluster.dart';
import 'package:meta/meta.dart';

part 'named_cluster.g.dart';

/// {@template named_cluster}
/// NamedCluster relates nicknames to cluster information.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class NamedCluster extends Equatable {
  /// {@macro named_cluster}
  const NamedCluster({
    required this.name,
    required this.cluster,
  });

  /// Creates a new instance from json.
  factory NamedCluster.fromJson(Map<String, dynamic> json) =>
      _$NamedClusterFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$NamedClusterToJson(this);

  /// Name is the nickname for this Cluster.
  @JsonKey(name: 'name')
  final String? name;

  /// Cluster holds the cluster information.
  @JsonKey(name: 'cluster')
  final Cluster? cluster;

  @override
  List<Object?> get props => [];

  @override
  bool get stringify => true;
}
