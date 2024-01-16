import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'context.g.dart';

/// {@template context}
/// Context is a tuple of references to a cluster (how do I communicate with
/// a kubernetes cluster), a user (how do I identify myself), and a namespace
/// (what subset of resources do I want to work with).
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class Context extends Equatable {
  /// {@macro context}
  const Context({
    required this.cluster,
    required this.authInfo,
    this.namespace,
  });

  /// Creates a new instance from json.
  factory Context.fromJson(Map<String, dynamic> json) =>
      _$ContextFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$ContextToJson(this);

  /// Cluster is the name of the cluster for this context
  @JsonKey(name: 'cluster')
  final String? cluster;

  /// Namespace is the default namespace to use on unspecified requests
  @JsonKey(name: 'namespace')
  final String? namespace;

  /// AuthInfo is the name of the user for this context
  @JsonKey(name: 'user')
  final String? authInfo;

  @override
  List<Object?> get props => [
        cluster,
        authInfo,
        namespace,
      ];

  @override
  bool get stringify => true;
}
