import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kubeconfig/src/models/auth_provider_config.dart';
import 'package:kubeconfig/src/models/exec.dart';
import 'package:meta/meta.dart';

part 'auth_info.g.dart';

/// {@template auth_info}
/// AuthInfo contains information that describes identity information.
/// This is use to tell the kubernetes cluster who you are.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class AuthInfo extends Equatable {
  /// {@macro auth_info}
  const AuthInfo({
    this.authProvider,
    this.clientCertificate,
    this.clientCertificateData,
    this.clientKey,
    this.clientKeyData,
    this.exec,
    this.impersonate,
    this.impersonateUID,
    this.impersonateGroups,
    this.impersonateUserExtra,
    this.password,
    this.token,
    this.tokenFile,
    this.username,
  });

  /// Creates a new instance from json.
  factory AuthInfo.fromJson(Map<String, dynamic> json) =>
      _$AuthInfoFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$AuthInfoToJson(this);

  /// AuthProvider specifies a custom authentication plugin for the kubernetes
  /// cluster.
  @JsonKey(name: 'auth-provider')
  final AuthProviderConfig? authProvider;

  /// ClientCertificate is the path to a client cert file for TLS.
  @JsonKey(name: 'client-certificate')
  final String? clientCertificate;

  /// ClientCertificateData contains PEM-encoded data from a client cert file
  /// for TLS. Overrides ClientCertificate
  @JsonKey(name: 'client-certificate-data')
  final String? clientCertificateData;

  /// ClientKey is the path to a client key file for TLS.
  @JsonKey(name: 'client-key')
  final String? clientKey;

  /// ClientKeyData contains PEM-encoded data from a client key file for TLS.
  /// Overrides ClientKey
  @JsonKey(name: 'client-key-data')
  final String? clientKeyData;

  /// Exec specifies a custom exec-based authentication plugin for the
  /// kubernetes cluster.
  @JsonKey(name: 'exec')
  final Exec? exec;

  /// Impersonate is the username to act-as.
  @JsonKey(name: 'as')
  final String? impersonate;

  /// ImpersonateGroups is the groups to impersonate.
  @JsonKey(name: 'as-groups')
  final List<String>? impersonateGroups;

  /// ImpersonateUID is the uid to impersonate.
  @JsonKey(name: 'as-uid')
  final String? impersonateUID;

  /// ImpersonateUserExtra contains additional information for impersonated
  /// user.
  @JsonKey(name: 'as-user-extra')
  final Map<String, List<String>>? impersonateUserExtra;

  /// Password is the password for basic authentication to the kubernetes
  /// cluster.
  @JsonKey(name: 'password')
  final String? password;

  /// Token is the bearer token for authentication to the kubernetes cluster.
  @JsonKey(name: 'token')
  final String? token;

  /// TokenFile is a pointer to a file that contains a bearer token
  /// (as described above).
  /// If both Token and TokenFile are present, Token takes precedence.
  @JsonKey(name: 'tokenFile')
  final String? tokenFile;

  /// Username is the username for basic authentication to the kubernetes
  /// cluster.
  @JsonKey(name: 'username')
  final String? username;

  @override
  List<Object?> get props => [
        authProvider,
        clientCertificate,
        clientCertificateData,
        clientKey,
        clientKeyData,
        exec,
        impersonate,
        impersonateGroups,
        impersonateUID,
        impersonateUserExtra,
        password,
        token,
        tokenFile,
        username,
      ];

  @override
  bool get stringify => true;
}
