import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'exec_env.g.dart';

/// {@template exec_env}
/// ExecEnvVar is used for setting environment variables when executing an
/// exec-based credential plugin.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class ExecEnv extends Equatable {
  /// {@macro exec_env}
  const ExecEnv({
    required this.name,
    required this.value,
  });

  /// Creates a new instance from json.
  factory ExecEnv.fromJson(Map<String, dynamic> json) =>
      _$ExecEnvFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$ExecEnvToJson(this);

  /// Name
  @JsonKey(name: 'name')
  final String? name;

  /// Value
  @JsonKey(name: 'value')
  final String? value;

  @override
  List<Object?> get props => [
        name,
        value,
      ];

  @override
  bool get stringify => true;
}
