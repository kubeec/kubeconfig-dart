import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kubeconfig/src/enums/interactive_mode.dart';
import 'package:kubeconfig/src/models/exec_env.dart';
import 'package:meta/meta.dart';

part 'exec.g.dart';

/// {@template exec}
/// ExecConfig specifies a command to provide client credentials. The command
/// is exec'd and outputs structured stdout holding
/// credentials.
///
/// See the client.authentication.k8s.io API group for specifications of the
/// exact input and output format.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class Exec extends Equatable {
  /// {@macro exec}
  const Exec({
    required this.command,
    required this.apiVersion,
    required this.interactiveMode,
    this.env,
    this.args,
    this.installHint,
    this.provideClusterInfo,
  });

  /// Creates a new instance from json.
  factory Exec.fromJson(Map<String, dynamic> json) => _$ExecFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$ExecToJson(this);

  /// Command to execute.
  @JsonKey(name: 'command')
  final String? command;

  /// Preferred input version of the ExecInfo. The returned ExecCredentials
  /// MUST use the same encoding version as the input.
  @JsonKey(name: 'apiVersion')
  final String? apiVersion;

  /// Env defines additional environment variables to expose to the process.
  /// These are unioned with the host's environment, as well as variables
  /// kubeconfig uses to pass argument to the plugin.
  @JsonKey(name: 'env')
  final List<ExecEnv>? env;

  /// Arguments to pass to the command when executing it.
  @JsonKey(name: 'args')
  final List<String>? args;

  /// This text is shown to the user when the executable doesn't seem to be
  /// present. For example, `brew install foo-cli`  might be a good InstallHint
  /// for foo-cli on Mac OS systems.
  @JsonKey(name: 'installHint')
  final String? installHint;

  /// InteractiveMode determines this plugin's relationship with standard input.
  /// Valid values are "Never" (this exec plugin never uses standard input),
  /// "IfAvailable" (this exec plugin wants to use standard input if it is
  /// available), or "Always" (this exec plugin requires standard input to
  /// function). See ExecInteractiveMode values for more details.
  ///
  /// If APIVersion is client.authentication.k8s.io/v1alpha1 or
  /// client.authentication.k8s.io/v1beta1, then this field is optional  and
  /// defaults to "IfAvailable" when unset. Otherwise, this field is required.
  @JsonKey(
    name: 'interactiveMode',
    unknownEnumValue: JsonKey.nullForUndefinedEnumValue,
    defaultValue: InteractiveMode.IfAvailable,
  )
  final InteractiveMode? interactiveMode;

  /// ProvideClusterInfo determines whether or not to provide cluster
  /// information, which could potentially contain very large CA data, to this
  /// exec plugin as a part of the KUBERNETES_EXEC_INFO environment variable.
  /// By default, it is set to false. Package k8s.io/client-go/tools/auth/exec
  /// provides helper methods for reading this environment variable.
  @JsonKey(name: 'provideClusterInfo')
  final bool? provideClusterInfo;

  @override
  List<Object?> get props => [
        command,
        apiVersion,
        interactiveMode,
        env,
        args,
        installHint,
        provideClusterInfo,
      ];

  @override
  bool get stringify => true;
}
