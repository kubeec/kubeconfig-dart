import 'package:equatable/equatable.dart';
import 'package:kubeconfig/src/enums/validation_code.dart';

/// {@template kubeconfig_exception}
/// Kubeconfig exception.
/// {@endtemplate}
class KubeconfigException extends Equatable implements Exception {
  /// {@macro kubeconfig_exception}
  const KubeconfigException({
    required this.code,
    this.message,
  });

  /// Exception validation code.
  final ValidationCode code;

  /// Exception message.
  final String? message;

  @override
  List<Object?> get props => [
        code,
        message,
      ];

  @override
  bool get stringify => true;
}

/// {@template required_exception}
/// Required exception.
/// {@endtemplate}
class RequiredException extends KubeconfigException {
  /// {@macro required_exception}
  const RequiredException({required super.code, super.message});
}

/// {@template named_cluster_duplicate}
/// Named cluster is duplicate exception.
/// {@endtemplate}
class NamedClusterDuplicateException extends KubeconfigException {
  /// {@macro named_cluster_duplicate}
  const NamedClusterDuplicateException({super.message})
      : super(code: ValidationCode.namedClusterDuplicate);
}

/// {@template named_context_duplicate}
/// Named context is duplicate exception.
/// {@endtemplate}
class NamedContextDuplicateException extends KubeconfigException {
  /// {@macro named_context_duplicate}
  const NamedContextDuplicateException({super.message})
      : super(code: ValidationCode.namedContextDuplicate);
}

/// {@template named_user_duplicate}
// Named user is duplicate exception.
/// {@endtemplate}
class NamedUserDuplicateException extends KubeconfigException {
  /// {@macro named_user_duplicate}
  const NamedUserDuplicateException({super.message})
      : super(code: ValidationCode.namedUserDuplicate);
}

/// {@template current_context_not_found}
// Current context not found exception.
/// {@endtemplate}
class CurrentContextNotFoundException extends KubeconfigException {
  /// {@macro current_context_not_found}
  const CurrentContextNotFoundException({super.message})
      : super(code: ValidationCode.currentContextNotFound);
}

/// {@template cluster_not_found_for_context}
/// Cluster not found for context exception.
/// {@endtemplate}
class ClusterNotFoundForContextException extends KubeconfigException {
  /// {@macro cluster_not_found_for_context}
  const ClusterNotFoundForContextException({super.message})
      : super(code: ValidationCode.clusterNotFoundForContext);
}

/// {@template user_not_found_for_context}
/// User not found for context exception.
/// {@endtemplate}
class UserNotFoundForContextException extends KubeconfigException {
  /// {@macro user_not_found_for_context}
  const UserNotFoundForContextException({super.message})
      : super(code: ValidationCode.userNotFoundForContext);
}

/// {@template namespace_invalid_max_length_for_context}
/// Namespace invalid max length for context exception.
/// {@endtemplate}
class NamespaceInvalidMaxLengthForContextException extends KubeconfigException {
  /// {@macro namespace_invalid_max_length_for_context}
  const NamespaceInvalidMaxLengthForContextException({super.message})
      : super(code: ValidationCode.namespaceInvalidMaxLengthForContext);
}

/// {@template namespace_format_not_match_for_context}
/// Namespace format not match for context exception.
/// {@endtemplate}
class NamespaceFormatNotMatchForContextException extends KubeconfigException {
  /// {@macro namespace_format_not_match_for_context}
  const NamespaceFormatNotMatchForContextException({super.message})
      : super(code: ValidationCode.namespaceFormatNotMatchForContext);
}

/// {@template certificate_authority_error_for_cluster}
/// Certificate authority error for cluster exception.
/// {@endtemplate}
class CertificateAuthorityErrorForClusterException extends KubeconfigException {
  /// {@macro certificate_authority_error_for_cluster}
  const CertificateAuthorityErrorForClusterException({super.message})
      : super(code: ValidationCode.certificateAuthorityErrorForCluster);
}

/// {@template certificate_authority_file_error_for_cluster}
/// Certificate authority file error for cluster exception.
/// {@endtemplate}
class CertificateAuthorityFileErrorForClusterException
    extends KubeconfigException {
  /// {@macro certificate_authority_file_error_for_cluster}
  const CertificateAuthorityFileErrorForClusterException({super.message})
      : super(code: ValidationCode.certificateAuthorityFileErrorForCluster);
}

/// {@template proxy_url_invalid_for_cluster}
/// Proxy url invalid for cluster exception.
/// {@endtemplate}
class ProxyUrlInvalidForClusterException extends KubeconfigException {
  /// {@macro proxy_url_invalid_for_cluster}
  const ProxyUrlInvalidForClusterException({super.message})
      : super(code: ValidationCode.proxyUrlInvalidForCluster);
}

/// {@template proxy_url_invalid_scheme_for_cluster}
/// Proxy url invalid scheme for cluster exception.
/// {@endtemplate}
class ProxyUrlInvalidSchemeForClusterException extends KubeconfigException {
  /// {@macro proxy_url_invalid_scheme_for_cluster}
  const ProxyUrlInvalidSchemeForClusterException({super.message})
      : super(code: ValidationCode.proxyUrlInvalidSchemeForCluster);
}

/// {@template client_cert_error_for_user}
/// Client cert error for user exception.
/// {@endtemplate}
class ClientCertErrorForUserException extends KubeconfigException {
  /// {@macro client_cert_error_for_user}
  const ClientCertErrorForUserException({super.message})
      : super(code: ValidationCode.clientCertErrorForUser);
}

/// {@template client_key_error_for_user}
/// Client key error for user exception.
/// {@endtemplate}
class ClientKeyErrorForUserException extends KubeconfigException {
  /// {@macro client_key_error_for_user}
  const ClientKeyErrorForUserException({super.message})
      : super(code: ValidationCode.clientKeyErrorForUser);
}

/// {@template client_key_not_found_for_user}
/// Client key not found for user exception.
/// {@endtemplate}
class ClientKeyNotFoundForUserException extends KubeconfigException {
  /// {@macro client_key_not_found_for_user}
  const ClientKeyNotFoundForUserException({super.message})
      : super(code: ValidationCode.clientKeyNotFoundForUser);
}

/// {@template client_cert_file_error_for_user}
/// Client cert file error for user exception.
/// {@endtemplate}
class ClientCertFileErrorForUserException extends KubeconfigException {
  /// {@macro client_cert_file_error_for_user}
  const ClientCertFileErrorForUserException({super.message})
      : super(code: ValidationCode.clientCertFileErrorForUser);
}

/// {@template client_key_file_error_for_user}
/// Client key file error for user exception.
/// {@endtemplate}
class ClientKeyFileErrorForUserException extends KubeconfigException {
  /// {@macro client_key_file_error_for_user}
  const ClientKeyFileErrorForUserException({super.message})
      : super(code: ValidationCode.clientKeyFileErrorForUser);
}

/// {@template auth_provider_and_exec_error_for_user}
/// Auth provider and exec error for user exception.
/// {@endtemplate}
class AuthProviderAndExecErrorForUserException extends KubeconfigException {
  /// {@macro auth_provider_and_exec_error_for_user}
  const AuthProviderAndExecErrorForUserException({super.message})
      : super(code: ValidationCode.authProviderAndExecErrorForUser);
}

/// {@template exec_command_not_found_for_user}
/// Exec command not found for user exception.
/// {@endtemplate}
class ExecCommandNotFoundForUserException extends KubeconfigException {
  /// {@macro exec_command_not_found_for_user}
  const ExecCommandNotFoundForUserException({super.message})
      : super(code: ValidationCode.execCommandNotFoundForUser);
}

/// {@template exec_api_version_not_found_for_user}
/// Exec apiVersion not found for user exception.
/// {@endtemplate}
class ExecApiVersionNotFoundForUserException extends KubeconfigException {
  /// {@macro exec_api_version_not_found_for_user}
  const ExecApiVersionNotFoundForUserException({super.message})
      : super(code: ValidationCode.execApiVersionNotFoundForUser);
}

/// {@template exec_env_name_not_found_for_user}
/// Exec env name not found for user exception.
/// {@endtemplate}
class ExecEnvNameNotFoundForUserException extends KubeconfigException {
  /// {@macro exec_env_name_not_found_for_user}
  const ExecEnvNameNotFoundForUserException({super.message})
      : super(code: ValidationCode.execEnvNameNotFoundForUser);
}

/// {@template more_than_one_auth_found_for_user}
/// More than one auth found for user exception.
/// {@endtemplate}
class MoreThanOneAuthFoundForUserException extends KubeconfigException {
  /// {@macro more_than_one_auth_found_for_user}
  const MoreThanOneAuthFoundForUserException({super.message})
      : super(code: ValidationCode.moreThanOneAuthFoundForUser);
}

/// {@template impersonating_error_for_user}
/// Impersonating error for user exception.
/// {@endtemplate}
class ImpersonatingErrorForUserException extends KubeconfigException {
  /// {@macro impersonating_error_for_user}
  const ImpersonatingErrorForUserException({super.message})
      : super(code: ValidationCode.impersonatingErrorForUser);
}
