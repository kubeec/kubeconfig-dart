import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kubeconfig/src/enums/validation_code.dart';
import 'package:kubeconfig/src/kubeconfig_util.dart';
import 'package:kubeconfig/src/models/named_auth_info.dart';
import 'package:kubeconfig/src/models/named_cluster.dart';
import 'package:kubeconfig/src/models/named_context.dart';
import 'package:kubeconfig/src/models/preferences.dart';
import 'package:kubeconfig/src/models/validation_result.dart';
import 'package:meta/meta.dart';

part 'kubeconfig.g.dart';

/// {@template kubeconfig}
/// Kubeconfig holds the information needed to build connect to remote
/// kubernetes clusters as a given user.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class Kubeconfig extends Equatable {
  /// {@macro kubeconfig}
  const Kubeconfig({
    required this.clusters,
    required this.contexts,
    required this.authInfos,
    this.apiVersion,
    this.currentContext,
    this.kind,
    this.preferences,
  });

  /// Creates a new instance from json.
  factory Kubeconfig.fromJson(Map<String, dynamic> json) =>
      _$KubeconfigFromJson(json);

  /// Creates a new instance from yaml.
  factory Kubeconfig.fromYaml(String yaml) =>
      KubeconfigUtil.convertYamlToObject(kubeconfigYaml: yaml);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$KubeconfigToJson(this);

  /// Converts to yaml.
  String toYaml() => KubeconfigUtil.convertObjectToYaml(kubeconfig: this);

  /// Validates the kubeconfig.
  ValidationResult validate({bool throwExceptions = false}) {
    return KubeconfigUtil.validate(
      kubeconfig: this,
      throwExceptions: throwExceptions,
    );
  }

  /// Merges a kubeconfig into this object.
  /// Returns null if kubeconfig objects (source and target) are not valid
  /// when [validate] is true and [throwExceptions] is false
  Kubeconfig? merge(
    Kubeconfig config, {
    bool validate = true,
    bool throwExceptions = false,
    bool preserveCurrentContext = false,
  }) {
    if (validate) {
      final resultSource = KubeconfigUtil.validate(
        kubeconfig: this,
        throwExceptions: throwExceptions,
      );

      if (resultSource.code != ValidationCode.valid) {
        return null;
      }

      final resultTarget = KubeconfigUtil.validate(
        kubeconfig: config,
        throwExceptions: throwExceptions,
      );

      if (resultTarget.code != ValidationCode.valid) {
        return null;
      }
    }

    Kubeconfig kubeconfig;

    if (!preserveCurrentContext) {
      kubeconfig = copyWith(currentContext: config.currentContext);
    } else {
      kubeconfig = copyWith();
    }

    final clusterList = clusters!;
    final authInfoList = authInfos!;
    final contextList = contexts!;

    for (final cluster in config.clusters!) {
      clusterList.add(cluster);
    }

    kubeconfig = kubeconfig.copyWith(clusters: clusterList);

    for (final authInfo in config.authInfos!) {
      authInfoList.add(authInfo);
    }

    kubeconfig = kubeconfig.copyWith(authInfos: authInfoList);

    for (final context in config.contexts!) {
      contextList.add(context);
    }

    return kubeconfig.copyWith(contexts: contextList);
  }

  /// v1 (default value)
  @JsonKey(name: 'apiVersion', defaultValue: 'v1')
  final String? apiVersion;

  /// Clusters is a map of referencable names to cluster configs.
  @JsonKey(name: 'clusters')
  final List<NamedCluster>? clusters;

  /// Contexts is a map of referencable names to context configs.
  @JsonKey(name: 'contexts')
  final List<NamedContext>? contexts;

  /// CurrentContext is the name of the context that you would like to use
  /// by default.
  @JsonKey(name: 'current-context')
  final String? currentContext;

  /// Config (default value)
  @JsonKey(name: 'kind', defaultValue: 'Config')
  final String? kind;

  /// Preferences holds general information to be use for cli interactions.
  @JsonKey(name: 'preferences')
  final Preferences? preferences;

  /// AuthInfos is a map of referencable names to user configs.
  @JsonKey(name: 'users')
  final List<NamedAuthInfo>? authInfos;

  @override
  List<Object?> get props => [
        clusters,
        contexts,
        authInfos,
        apiVersion,
        currentContext,
        kind,
        preferences,
      ];

  @override
  bool get stringify => true;
}
