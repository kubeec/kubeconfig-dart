import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kubeconfig/src/models/auth_info.dart';
import 'package:meta/meta.dart';

part 'named_auth_info.g.dart';

/// {@template named_auth_info}
/// NamedAuthInfo relates nicknames to auth information.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class NamedAuthInfo extends Equatable {
  /// {@macro named_auth_info}
  const NamedAuthInfo({
    required this.name,
    required this.user,
  });

  /// Creates a new instance from json.
  factory NamedAuthInfo.fromJson(Map<String, dynamic> json) =>
      _$NamedAuthInfoFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$NamedAuthInfoToJson(this);

  /// Name is the nickname for this AuthInfo.
  @JsonKey(name: 'name')
  final String? name;

  /// AuthInfo holds the auth information.
  @JsonKey(name: 'user')
  final AuthInfo? user;

  @override
  List<Object?> get props => [
        name,
        user,
      ];

  @override
  bool get stringify => true;
}
