import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:kubeconfig/src/enums/validation_code.dart';
import 'package:kubeconfig/src/exceptions/kubeconfig_exception.dart';
import 'package:kubeconfig/src/extensions/object_extensions.dart';
import 'package:kubeconfig/src/extensions/string_extensions.dart';
import 'package:kubeconfig/src/models/kubeconfig.dart';
import 'package:kubeconfig/src/models/validation_result.dart';

/// {@template kubeconfig_command_runner}
/// Utility functions for kubeconfig files and objects.
/// {@endtemplate}
class KubeconfigUtil {
  /// Converts a yaml to kubeconfig object.
  static Kubeconfig convertYamlToObject({required String kubeconfigYaml}) {
    final kubeconfigJson = kubeconfigYaml.yamlToJson();
    final kubeconfig = Kubeconfig.fromJson(kubeconfigJson);

    return kubeconfig;
  }

  /// Converts a kubeconfig object to yaml.
  static String convertObjectToYaml({required Kubeconfig kubeconfig}) {
    final kubeconfigJson = json.encode(kubeconfig.toJson());
    final kubeconfigYaml =
        (json.decode(kubeconfigJson) as Map<String, dynamic>).toYaml();

    return kubeconfigYaml;
  }

  /// Validates a kubeconfig object.
  static ValidationResult validate({
    required Kubeconfig kubeconfig,
    bool throwExceptions = false,
  }) {
    var validationResult = _checkRequiredCoreFields(
      kubeconfig: kubeconfig,
      throwExceptions: throwExceptions,
    );
    if (validationResult.code != ValidationCode.valid) return validationResult;

    validationResult = _checkRequiredNamedFields(
      kubeconfig: kubeconfig,
      throwExceptions: throwExceptions,
    );
    if (validationResult.code != ValidationCode.valid) return validationResult;

    validationResult = _validateContexts(
      kubeconfig: kubeconfig,
      throwExceptions: throwExceptions,
    );
    if (validationResult.code != ValidationCode.valid) return validationResult;

    validationResult = _validateAuthInfos(
      kubeconfig: kubeconfig,
      throwExceptions: throwExceptions,
    );
    if (validationResult.code != ValidationCode.valid) return validationResult;

    validationResult = _validateClusters(
      kubeconfig: kubeconfig,
      throwExceptions: throwExceptions,
    );
    if (validationResult.code != ValidationCode.valid) return validationResult;

    return validationResult;
  }

  static ValidationResult _checkRequiredCoreFields({
    required Kubeconfig kubeconfig,
    bool throwExceptions = false,
  }) {
    if (kubeconfig.clusters == null) {
      if (throwExceptions) {
        // ignore: prefer_const_constructors
        throw RequiredException(
          code: ValidationCode.clustersRequired,
          message: '"clusters" was not found',
        );
      }

      return const ValidationResult(
        code: ValidationCode.clustersRequired,
        description: '"clusters" was not found',
      );
    }

    if (kubeconfig.contexts == null) {
      if (throwExceptions) {
        // ignore: prefer_const_constructors
        throw RequiredException(
          code: ValidationCode.contextsRequired,
          message: '"contexts" was not found',
        );
      }

      return const ValidationResult(
        code: ValidationCode.contextsRequired,
        description: '"contexts" was not found',
      );
    }

    if (kubeconfig.authInfos == null) {
      if (throwExceptions) {
        // ignore: prefer_const_constructors
        throw RequiredException(
          code: ValidationCode.usersRequired,
          message: '"users" was not found',
        );
      }

      return const ValidationResult(
        code: ValidationCode.usersRequired,
        description: '"users" was not found',
      );
    }

    return const ValidationResult(
      code: ValidationCode.valid,
      description: 'Valid',
    );
  }

  static ValidationResult _checkRequiredNamedFields({
    required Kubeconfig kubeconfig,
    bool throwExceptions = false,
  }) {
    // Check contexts
    for (final context in kubeconfig.contexts!) {
      if (context.name.isNullOrEmpty) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.nameRequiredForNamedContext,
            message: '"name" is required for a named context',
          );
        }

        return const ValidationResult(
          code: ValidationCode.nameRequiredForNamedContext,
          description: '"name" is required for a named context',
        );
      }

      if (context.context == null) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.contextRequiredForNamedContext,
            message: '"context" is required for a named context',
          );
        }

        return const ValidationResult(
          code: ValidationCode.contextRequiredForNamedContext,
          description: '"context" is required for a named context',
        );
      }
    }

    // Check authInfos
    for (final authInfo in kubeconfig.authInfos!) {
      if (authInfo.name.isNullOrEmpty) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.nameRequiredForNamedUser,
            message: '"name" is required for a named user',
          );
        }

        return const ValidationResult(
          code: ValidationCode.nameRequiredForNamedUser,
          description: '"name" is required for a named user',
        );
      }

      if (authInfo.user == null) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.userRequiredForNamedUser,
            message: '"user" is required for a named user',
          );
        }

        return const ValidationResult(
          code: ValidationCode.userRequiredForNamedUser,
          description: '"user" is required for a named user',
        );
      }
    }

    // Check clusters
    for (final cluster in kubeconfig.clusters!) {
      if (cluster.name.isNullOrEmpty) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.nameRequiredForNamedCluster,
            message: '"name" is required for a named cluster',
          );
        }

        return const ValidationResult(
          code: ValidationCode.nameRequiredForNamedCluster,
          description: '"name" is required for a named cluster',
        );
      }

      if (cluster.cluster == null) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.clusterRequiredForNamedCluster,
            message: '"cluster" is required for a named cluster',
          );
        }

        return const ValidationResult(
          code: ValidationCode.clusterRequiredForNamedCluster,
          description: '"cluster" is required for a named cluster',
        );
      }
    }

    return const ValidationResult(
      code: ValidationCode.valid,
      description: 'Valid',
    );
  }

  static ValidationResult _validateContexts({
    required Kubeconfig kubeconfig,
    bool throwExceptions = false,
  }) {
    const clusterRequiredError = '"cluster" is required for a context';
    const userRequiredError = '"user" is required for a context';
    const currentContextNotFoundError = 'Current context was not found';
    const duplicateError = 'No more than one context with the same name';
    const clusterNotFoundError =
        'cluster "{0}" was not found for context "{1}"';
    const userNotFoundError = 'user "{0}" was not found for context "{1}"';
    const namespaceMaxLength = 63; // DNS (RFC 1123) label's max length
    const namespaceFormat =
        r'^[a-z0-9]([-a-z0-9]*[a-z0-9])?$'; // DNS (RFC 1123) label's regex
    const namespaceMaxLengthError = 'namespace "{0}" for context "{1}" max '
        'length cannot be greater than 63';
    const namespaceFormatError = 'namespace "{0}" for context "{1}" must be '
        'lower case alphanumeric characters with dash';

    for (final context in kubeconfig.contexts!) {
      // Check required fields
      if (context.context!.cluster.isNullOrEmpty) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.clusterRequiredForContext,
            message: clusterRequiredError,
          );
        }

        return const ValidationResult(
          code: ValidationCode.clusterRequiredForContext,
          description: clusterRequiredError,
        );
      }

      if (context.context!.authInfo.isNullOrEmpty) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.userRequiredForContext,
            message: userRequiredError,
          );
        }

        return const ValidationResult(
          code: ValidationCode.userRequiredForContext,
          description: userRequiredError,
        );
      }

      // Check duplicates
      if (kubeconfig.contexts!.where((x) => x.name == context.name).length >
          1) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw NamedContextDuplicateException(
            message: duplicateError,
          );
        }

        return const ValidationResult(
          code: ValidationCode.namedContextDuplicate,
          description: duplicateError,
        );
      }

      // Check cluster
      if (kubeconfig.clusters!
              .firstWhereOrNull((x) => x.name == context.context!.cluster!) ==
          null) {
        if (throwExceptions) {
          throw ClusterNotFoundForContextException(
            message: clusterNotFoundError
                .format([context.context!.cluster!, context.name!]),
          );
        }

        return ValidationResult(
          code: ValidationCode.clusterNotFoundForContext,
          description: clusterNotFoundError
              .format([context.context!.cluster!, context.name!]),
        );
      }

      // Check user
      if (kubeconfig.authInfos!
              .firstWhereOrNull((x) => x.name == context.context!.authInfo!) ==
          null) {
        if (throwExceptions) {
          throw UserNotFoundForContextException(
            message: userNotFoundError
                .format([context.context!.authInfo!, context.name!]),
          );
        }

        return ValidationResult(
          code: ValidationCode.userNotFoundForContext,
          description: userNotFoundError
              .format([context.context!.authInfo!, context.name!]),
        );
      }

      // Check namespace length
      if (!context.context!.namespace.isNullOrEmpty &&
          context.context!.namespace!.length > namespaceMaxLength) {
        if (throwExceptions) {
          throw NamespaceInvalidMaxLengthForContextException(
            message: namespaceMaxLengthError
                .format([context.context!.namespace!, context.name!]),
          );
        }

        return ValidationResult(
          code: ValidationCode.namespaceInvalidMaxLengthForContext,
          description: namespaceMaxLengthError
              .format([context.context!.namespace!, context.name!]),
        );
      }

      // Check namespace format
      if (!context.context!.namespace.isNullOrEmpty &&
          !RegExp(namespaceFormat).hasMatch(context.context!.namespace!)) {
        if (throwExceptions) {
          throw NamespaceFormatNotMatchForContextException(
            message: namespaceFormatError
                .format([context.context!.namespace!, context.name!]),
          );
        }

        return ValidationResult(
          code: ValidationCode.namespaceFormatNotMatchForContext,
          description: namespaceFormatError
              .format([context.context!.namespace!, context.name!]),
        );
      }
    }

    // Check current context
    if (!kubeconfig.currentContext.isNullOrEmpty &&
        kubeconfig.contexts!
                .firstWhereOrNull((x) => x.name == kubeconfig.currentContext) ==
            null) {
      if (throwExceptions) {
        // ignore: prefer_const_constructors
        throw CurrentContextNotFoundException(
          message: currentContextNotFoundError,
        );
      }

      return const ValidationResult(
        code: ValidationCode.currentContextNotFound,
        description: currentContextNotFoundError,
      );
    }

    return const ValidationResult(
      code: ValidationCode.valid,
      description: 'Valid',
    );
  }

  static ValidationResult _validateAuthInfos({
    required Kubeconfig kubeconfig,
    bool throwExceptions = false,
  }) {
    const duplicateError = 'No more than one user with the same name';
    const clientCertError =
        'client-cert-data and client-cert are both specified for "{0}"';
    const clientKeyError =
        'client-key-data and client-key are both specified for "{0}"';
    const clientKeySpecifiedError = 'client-key-data or client-key must be '
        'specified for "{0}" to use the clientCert auth method';
    const clientCertFileError = 'Unable to read client-cert "{0}" for "{1}"';
    const clientKeyFileError = 'Unable to read client-key "{0}" for "{1}"';
    const authProviderAndExecError = 'authProvider cannot be provided in '
        'combination with an exec plugin for "{0}"';
    const execCommandError =
        'command must be specified for "{0}" to use exec authentication plugin';
    const execApiVersionError = 'apiVersion must be specified for "{0}" to use '
        'exec authentication plugin';
    const execEnvError = 'env variable name must be specified for "{0}" to '
        'use exec authentication plugin';
    const moreThanOneAuthError = 'More than one authentication method found '
        'for "{0}"; found [token, basicAuth], only one is allowed';
    const impersonatingError = 'Requesting uid, groups or user-extra for "{0}" '
        'without impersonating a user';

    for (final authInfo in kubeconfig.authInfos!) {
      // Check required fields
      // * No required field for now

      // Check duplicates
      if (kubeconfig.authInfos!.where((x) => x.name == authInfo.name).length >
          1) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw NamedUserDuplicateException(
            message: duplicateError,
          );
        }

        return const ValidationResult(
          code: ValidationCode.namedUserDuplicate,
          description: duplicateError,
        );
      }

      // Check client certificates
      if (!authInfo.user!.clientCertificate.isNullOrEmpty ||
          !authInfo.user!.clientCertificateData.isNullOrEmpty) {
        // Make sure client certificate data and file aren't both specified
        if (!authInfo.user!.clientCertificate.isNullOrEmpty &&
            !authInfo.user!.clientCertificateData.isNullOrEmpty) {
          if (throwExceptions) {
            throw ClientCertErrorForUserException(
              message: clientCertError.format([authInfo.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.clientCertErrorForUser,
            description: clientCertError.format([authInfo.name!]),
          );
        }

        // Make sure client key data and file aren't both specified
        if (!authInfo.user!.clientKey.isNullOrEmpty &&
            !authInfo.user!.clientKeyData.isNullOrEmpty) {
          if (throwExceptions) {
            throw ClientKeyErrorForUserException(
              message: clientKeyError.format([authInfo.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.clientKeyErrorForUser,
            description: clientKeyError.format([authInfo.name!]),
          );
        }

        // Make sure client key data or client key is specified
        if (authInfo.user!.clientKey.isNullOrEmpty &&
            authInfo.user!.clientKeyData.isNullOrEmpty) {
          if (throwExceptions) {
            throw ClientKeyNotFoundForUserException(
              message: clientKeySpecifiedError.format([authInfo.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.clientKeyNotFoundForUser,
            description: clientKeySpecifiedError.format([authInfo.name!]),
          );
        }

        // Check client certificate file exists
        if (!authInfo.user!.clientCertificate.isNullOrEmpty &&
            !File(authInfo.user!.clientCertificate!).existsSync()) {
          if (throwExceptions) {
            throw ClientCertFileErrorForUserException(
              message: clientCertFileError
                  .format([authInfo.user!.clientCertificate!, authInfo.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.clientCertFileErrorForUser,
            description: clientCertFileError
                .format([authInfo.user!.clientCertificate!, authInfo.name!]),
          );
        }

        // Check client key file exists
        if (!authInfo.user!.clientKey.isNullOrEmpty &&
            !File(authInfo.user!.clientKey!).existsSync()) {
          if (throwExceptions) {
            throw ClientKeyFileErrorForUserException(
              message: clientKeyFileError
                  .format([authInfo.user!.clientKey!, authInfo.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.clientKeyFileErrorForUser,
            description: clientKeyFileError
                .format([authInfo.user!.clientKey!, authInfo.name!]),
          );
        }
      }

      // Make sure authProvider and exec aren't both specified
      if (authInfo.user!.authProvider != null && authInfo.user!.exec != null) {
        if (throwExceptions) {
          throw AuthProviderAndExecErrorForUserException(
            message: authProviderAndExecError.format([authInfo.name!]),
          );
        }

        return ValidationResult(
          code: ValidationCode.authProviderAndExecErrorForUser,
          description: authProviderAndExecError.format([authInfo.name!]),
        );
      }

      // Validate exec
      if (authInfo.user!.exec != null) {
        // Make sure exec command is specified
        if (authInfo.user!.exec!.command.isNullOrEmpty) {
          if (throwExceptions) {
            throw ExecCommandNotFoundForUserException(
              message: execCommandError.format([authInfo.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.execCommandNotFoundForUser,
            description: execCommandError.format([authInfo.name!]),
          );
        }

        // Make sure exec apiVersion is specified
        if (authInfo.user!.exec!.apiVersion.isNullOrEmpty) {
          if (throwExceptions) {
            throw ExecApiVersionNotFoundForUserException(
              message: execApiVersionError.format([authInfo.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.execApiVersionNotFoundForUser,
            description: execApiVersionError.format([authInfo.name!]),
          );
        }

        // Make sure exec env name is specified
        if (authInfo.user!.exec!.env != null &&
            authInfo.user!.exec!.env!.isNotEmpty) {
          for (final env in authInfo.user!.exec!.env!) {
            if (env.name.isNullOrEmpty) {
              if (throwExceptions) {
                throw ExecEnvNameNotFoundForUserException(
                  message: execEnvError.format([authInfo.name!]),
                );
              }

              return ValidationResult(
                code: ValidationCode.execEnvNameNotFoundForUser,
                description: execEnvError.format([authInfo.name!]),
              );
            }
          }
        }
      }

      // Check multiple auth methods
      if (!authInfo.user!.token.isNullOrEmpty &&
          (!authInfo.user!.username.isNullOrEmpty ||
              !authInfo.user!.password.isNullOrEmpty)) {
        if (throwExceptions) {
          throw MoreThanOneAuthFoundForUserException(
            message: moreThanOneAuthError.format([authInfo.name!]),
          );
        }

        return ValidationResult(
          code: ValidationCode.moreThanOneAuthFoundForUser,
          description: moreThanOneAuthError.format([authInfo.name!]),
        );
      }

      // Make sure impersonate is specified
      if (authInfo.user!.impersonate.isNullOrEmpty &&
          (!authInfo.user!.impersonateUID.isNullOrEmpty ||
              authInfo.user!.impersonateGroups != null ||
              authInfo.user!.impersonateUserExtra != null)) {
        if (throwExceptions) {
          throw ImpersonatingErrorForUserException(
            message: impersonatingError.format([authInfo.name!]),
          );
        }

        return ValidationResult(
          code: ValidationCode.impersonatingErrorForUser,
          description: impersonatingError.format([authInfo.name!]),
        );
      }
    }

    return const ValidationResult(
      code: ValidationCode.valid,
      description: 'Valid',
    );
  }

  static ValidationResult _validateClusters({
    required Kubeconfig kubeconfig,
    bool throwExceptions = false,
  }) {
    const serverRequiredError = '"server" is required for a cluster';
    const duplicateError = 'No more than one cluster with the same name';
    const certificateAuthorityError = 'certificate-authority-data and '
        'certificate-authority are both specified for "{0}"';
    const certificateAuthorityFileError =
        'Unable to read certificate-authority "{0}" for "{1}"';
    const proxyUrlError = 'Invalid proxy-url for "{0}"';
    const proxyUrlSchemeError = 'Unsupported proxy-url scheme "{0}", must be '
        'http, https, or socks5 for "{1}"';

    for (final cluster in kubeconfig.clusters!) {
      // Check required fields
      if (cluster.cluster!.server.isNullOrEmpty) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw RequiredException(
            code: ValidationCode.serverRequiredForCluster,
            message: serverRequiredError,
          );
        }

        return const ValidationResult(
          code: ValidationCode.serverRequiredForCluster,
          description: serverRequiredError,
        );
      }

      // Check duplicates
      if (kubeconfig.clusters!.where((x) => x.name == cluster.name).length >
          1) {
        if (throwExceptions) {
          // ignore: prefer_const_constructors
          throw NamedClusterDuplicateException(
            message: duplicateError,
          );
        }

        return const ValidationResult(
          code: ValidationCode.namedClusterDuplicate,
          description: duplicateError,
        );
      }

      // Make sure CA data and file aren't both specified
      if (!cluster.cluster!.certificateAuthority.isNullOrEmpty &&
          !cluster.cluster!.certificateAuthorityData.isNullOrEmpty) {
        if (throwExceptions) {
          throw CertificateAuthorityErrorForClusterException(
            message: certificateAuthorityError.format([cluster.name!]),
          );
        }

        return ValidationResult(
          code: ValidationCode.certificateAuthorityErrorForCluster,
          description: certificateAuthorityError.format([cluster.name!]),
        );
      }

      // Check CA file exists
      if (!cluster.cluster!.certificateAuthority.isNullOrEmpty &&
          !File(cluster.cluster!.certificateAuthority!).existsSync()) {
        if (throwExceptions) {
          throw CertificateAuthorityFileErrorForClusterException(
            message: certificateAuthorityFileError.format(
              [cluster.cluster!.certificateAuthority!, cluster.name!],
            ),
          );
        }

        return ValidationResult(
          code: ValidationCode.certificateAuthorityFileErrorForCluster,
          description: certificateAuthorityFileError
              .format([cluster.cluster!.certificateAuthority!, cluster.name!]),
        );
      }

      // Check proxy url
      if (!cluster.cluster!.proxyURL.isNullOrEmpty) {
        final proxyUri = Uri.tryParse(cluster.cluster!.proxyURL!);

        if (proxyUri == null) {
          if (throwExceptions) {
            throw ProxyUrlInvalidForClusterException(
              message: proxyUrlError.format([cluster.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.proxyUrlInvalidForCluster,
            description: proxyUrlError.format([cluster.name!]),
          );
        } else if (!['http', 'https', 'socks5'].contains(proxyUri.scheme)) {
          if (throwExceptions) {
            throw ProxyUrlInvalidSchemeForClusterException(
              message:
                  proxyUrlSchemeError.format([proxyUri.scheme, cluster.name!]),
            );
          }

          return ValidationResult(
            code: ValidationCode.proxyUrlInvalidSchemeForCluster,
            description:
                proxyUrlSchemeError.format([proxyUri.scheme, cluster.name!]),
          );
        }
      }
    }

    return const ValidationResult(
      code: ValidationCode.valid,
      description: 'Valid',
    );
  }
}
