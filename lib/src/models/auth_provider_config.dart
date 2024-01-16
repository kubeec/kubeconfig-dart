import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'auth_provider_config.g.dart';

/// {@template auth_provider_config}
/// AuthProviderConfig holds the configuration for a specified auth provider.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class AuthProviderConfig extends Equatable {
  /// {@macro auth_provider_config}
  const AuthProviderConfig({
    required this.name,
    required this.config,
  });

  /// Creates a new instance from json.
  factory AuthProviderConfig.fromJson(Map<String, dynamic> json) =>
      _$AuthProviderConfigFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$AuthProviderConfigToJson(this);

  /// Name
  @JsonKey(name: 'name')
  final String? name;

  /// Config
  @JsonKey(name: 'config')
  final Map<String, String>? config;

  @override
  List<Object?> get props => [
        name,
        config,
      ];

  @override
  bool get stringify => true;
}
