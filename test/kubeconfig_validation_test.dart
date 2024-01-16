import 'dart:io';

import 'package:kubeconfig/kubeconfig.dart';
import 'package:test/test.dart';

void main() {
  group('ValidationCode', () {
    Future<Kubeconfig> getKubeconfig(String file) async {
      final kubeconfigYaml = await File('test/files/$file').readAsString();
      final kubeconfig = Kubeconfig.fromYaml(kubeconfigYaml);
      return kubeconfig;
    }

    test('valid (single)', () async {
      final result = (await getKubeconfig('valid.yaml')).validate();
      expect(result.code, ValidationCode.valid);
    });

    test('valid (multi)', () async {
      final kubeconfig = await getKubeconfig('valid_multi.yaml');
      final result = kubeconfig.validate();
      expect(result.code, ValidationCode.valid);
      expect(kubeconfig.contexts, isNotNull);
      expect(kubeconfig.contexts!.length, 9);
    });

    test('clustersRequired', () async {
      final result =
          (await getKubeconfig('invalid_clusters_required.yaml')).validate();
      expect(result.code, ValidationCode.clustersRequired);
      expect(
        () async => (await getKubeconfig('invalid_clusters_required.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('contextsRequired', () async {
      final result =
          (await getKubeconfig('invalid_contexts_required.yaml')).validate();
      expect(result.code, ValidationCode.contextsRequired);
      expect(
        () async => (await getKubeconfig('invalid_contexts_required.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('usersRequired', () async {
      final result =
          (await getKubeconfig('invalid_users_required.yaml')).validate();
      expect(result.code, ValidationCode.usersRequired);
      expect(
        () async => (await getKubeconfig('invalid_users_required.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('nameRequiredForNamedCluster', () async {
      final result =
          (await getKubeconfig('invalid_clusters_name.yaml')).validate();
      expect(result.code, ValidationCode.nameRequiredForNamedCluster);
      expect(
        () async => (await getKubeconfig('invalid_clusters_name.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('nameRequiredForNamedContext', () async {
      final result =
          (await getKubeconfig('invalid_contexts_name.yaml')).validate();
      expect(result.code, ValidationCode.nameRequiredForNamedContext);
      expect(
        () async => (await getKubeconfig('invalid_contexts_name.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('nameRequiredForNamedUsers', () async {
      final result =
          (await getKubeconfig('invalid_users_name.yaml')).validate();
      expect(result.code, ValidationCode.nameRequiredForNamedUser);
      expect(
        () async => (await getKubeconfig('invalid_users_name.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('clusterRequiredForNamedCluster', () async {
      final result =
          (await getKubeconfig('invalid_clusters_cluster.yaml')).validate();
      expect(result.code, ValidationCode.clusterRequiredForNamedCluster);
      expect(
        () async => (await getKubeconfig('invalid_clusters_cluster.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('contextRequiredForNamedContext', () async {
      final result =
          (await getKubeconfig('invalid_contexts_context.yaml')).validate();
      expect(result.code, ValidationCode.contextRequiredForNamedContext);
      expect(
        () async => (await getKubeconfig('invalid_contexts_context.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('userRequiredForNamedUsers', () async {
      final result =
          (await getKubeconfig('invalid_users_user.yaml')).validate();
      expect(result.code, ValidationCode.userRequiredForNamedUser);
      expect(
        () async => (await getKubeconfig('invalid_users_user.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('serverRequiredForCluster', () async {
      final result =
          (await getKubeconfig('invalid_cluster_server.yaml')).validate();
      expect(result.code, ValidationCode.serverRequiredForCluster);
      expect(
        () async => (await getKubeconfig('invalid_cluster_server.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('clusterRequiredForContext', () async {
      final result =
          (await getKubeconfig('invalid_context_cluster.yaml')).validate();
      expect(result.code, ValidationCode.clusterRequiredForContext);
      expect(
        () async => (await getKubeconfig('invalid_context_cluster.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('userRequiredForContext', () async {
      final result =
          (await getKubeconfig('invalid_context_user.yaml')).validate();
      expect(result.code, ValidationCode.userRequiredForContext);
      expect(
        () async => (await getKubeconfig('invalid_context_user.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<RequiredException>()),
      );
    });

    test('namedClusterDuplicate', () async {
      final result =
          (await getKubeconfig('invalid_clusters_duplicate.yaml')).validate();
      expect(result.code, ValidationCode.namedClusterDuplicate);
      expect(
        () async => (await getKubeconfig('invalid_clusters_duplicate.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<NamedClusterDuplicateException>()),
      );
    });

    test('namedContextDuplicate', () async {
      final result =
          (await getKubeconfig('invalid_contexts_duplicate.yaml')).validate();
      expect(result.code, ValidationCode.namedContextDuplicate);
      expect(
        () async => (await getKubeconfig('invalid_contexts_duplicate.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<NamedContextDuplicateException>()),
      );
    });

    test('namedUserDuplicate', () async {
      final result =
          (await getKubeconfig('invalid_users_duplicate.yaml')).validate();
      expect(result.code, ValidationCode.namedUserDuplicate);
      expect(
        () async => (await getKubeconfig('invalid_users_duplicate.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<NamedUserDuplicateException>()),
      );
    });

    test('currentContextNotFound', () async {
      final result =
          (await getKubeconfig('invalid_current_context.yaml')).validate();
      expect(result.code, ValidationCode.currentContextNotFound);
      expect(
        () async => (await getKubeconfig('invalid_current_context.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<CurrentContextNotFoundException>()),
      );
    });

    test('clusterNotFoundForContext', () async {
      final result =
          (await getKubeconfig('invalid_context_cluster_missing.yaml'))
              .validate();
      expect(result.code, ValidationCode.clusterNotFoundForContext);
      expect(
        () async =>
            (await getKubeconfig('invalid_context_cluster_missing.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<ClusterNotFoundForContextException>()),
      );
    });

    test('userNotFoundForContext', () async {
      final result =
          (await getKubeconfig('invalid_context_user_missing.yaml')).validate();
      expect(result.code, ValidationCode.userNotFoundForContext);
      expect(
        () async => (await getKubeconfig('invalid_context_user_missing.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<UserNotFoundForContextException>()),
      );
    });

    test('namespaceInvalidMaxLengthForContext', () async {
      final result =
          (await getKubeconfig('invalid_context_namespace_length.yaml'))
              .validate();
      expect(result.code, ValidationCode.namespaceInvalidMaxLengthForContext);
      expect(
        () async =>
            (await getKubeconfig('invalid_context_namespace_length.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<NamespaceInvalidMaxLengthForContextException>()),
      );
    });

    test('namespaceFormatNotMatchForContext', () async {
      final result =
          (await getKubeconfig('invalid_context_namespace_format.yaml'))
              .validate();
      expect(result.code, ValidationCode.namespaceFormatNotMatchForContext);
      expect(
        () async =>
            (await getKubeconfig('invalid_context_namespace_format.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<NamespaceFormatNotMatchForContextException>()),
      );
    });

    test('certificateAuthorityErrorForCluster', () async {
      final result =
          (await getKubeconfig('invalid_cluster_certificate_both.yaml'))
              .validate();
      expect(result.code, ValidationCode.certificateAuthorityErrorForCluster);
      expect(
        () async =>
            (await getKubeconfig('invalid_cluster_certificate_both.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<CertificateAuthorityErrorForClusterException>()),
      );
    });

    test('certificateAuthorityFileErrorForCluster', () async {
      final result =
          (await getKubeconfig('invalid_cluster_certificate_file.yaml'))
              .validate();
      expect(
        result.code,
        ValidationCode.certificateAuthorityFileErrorForCluster,
      );
      expect(
        () async =>
            (await getKubeconfig('invalid_cluster_certificate_file.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<CertificateAuthorityFileErrorForClusterException>()),
      );
    });

    test('proxyUrlInvalidForCluster', () async {
      final result =
          (await getKubeconfig('invalid_cluster_proxyurl.yaml')).validate();
      expect(result.code, ValidationCode.proxyUrlInvalidForCluster);
      expect(
        () async => (await getKubeconfig('invalid_cluster_proxyurl.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<ProxyUrlInvalidForClusterException>()),
      );
    });

    test('proxyUrlInvalidSchemeForCluster', () async {
      final result =
          (await getKubeconfig('invalid_cluster_proxyurl_scheme.yaml'))
              .validate();
      expect(result.code, ValidationCode.proxyUrlInvalidSchemeForCluster);
      expect(
        () async =>
            (await getKubeconfig('invalid_cluster_proxyurl_scheme.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<ProxyUrlInvalidSchemeForClusterException>()),
      );
    });

    test('clientCertErrorForUser', () async {
      final result = (await getKubeconfig('invalid_user_certificate_both.yaml'))
          .validate();
      expect(result.code, ValidationCode.clientCertErrorForUser);
      expect(
        () async => (await getKubeconfig('invalid_user_certificate_both.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<ClientCertErrorForUserException>()),
      );
    });

    test('clientKeyErrorForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_clientkey_both.yaml')).validate();
      expect(result.code, ValidationCode.clientKeyErrorForUser);
      expect(
        () async => (await getKubeconfig('invalid_user_clientkey_both.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<ClientKeyErrorForUserException>()),
      );
    });

    test('clientKeyNotFoundForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_clientkey_missing.yaml'))
              .validate();
      expect(result.code, ValidationCode.clientKeyNotFoundForUser);
      expect(
        () async => (await getKubeconfig('invalid_user_clientkey_missing.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<ClientKeyNotFoundForUserException>()),
      );
    });

    test('clientCertFileErrorForUser', () async {
      final result = (await getKubeconfig('invalid_user_certificate_file.yaml'))
          .validate();
      expect(result.code, ValidationCode.clientCertFileErrorForUser);
      expect(
        () async => (await getKubeconfig('invalid_user_certificate_file.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<ClientCertFileErrorForUserException>()),
      );
    });

    test('clientKeyFileErrorForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_clientkey_file.yaml')).validate();
      expect(result.code, ValidationCode.clientKeyFileErrorForUser);
      expect(
        () async => (await getKubeconfig('invalid_user_clientkey_file.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<ClientKeyFileErrorForUserException>()),
      );
    });

    test('authProviderAndExecErrorForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_auth_provider.yaml')).validate();
      expect(result.code, ValidationCode.authProviderAndExecErrorForUser);
      expect(
        () async => (await getKubeconfig('invalid_user_auth_provider.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<AuthProviderAndExecErrorForUserException>()),
      );
    });

    test('execCommandNotFoundForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_exec_command_missing.yaml'))
              .validate();
      expect(result.code, ValidationCode.execCommandNotFoundForUser);
      expect(
        () async =>
            (await getKubeconfig('invalid_user_exec_command_missing.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<ExecCommandNotFoundForUserException>()),
      );
    });

    test('execApiVersionNotFoundForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_exec_apiversion_missing.yaml'))
              .validate();
      expect(result.code, ValidationCode.execApiVersionNotFoundForUser);
      expect(
        () async =>
            (await getKubeconfig('invalid_user_exec_apiversion_missing.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<ExecApiVersionNotFoundForUserException>()),
      );
    });

    test('execEnvNameNotFoundForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_exec_envname_missing.yaml'))
              .validate();
      expect(result.code, ValidationCode.execEnvNameNotFoundForUser);
      expect(
        () async =>
            (await getKubeconfig('invalid_user_exec_envname_missing.yaml'))
                .validate(throwExceptions: true),
        throwsA(isA<ExecEnvNameNotFoundForUserException>()),
      );
    });

    test('moreThanOneAuthFoundForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_multi_auth.yaml')).validate();
      expect(result.code, ValidationCode.moreThanOneAuthFoundForUser);
      expect(
        () async => (await getKubeconfig('invalid_user_multi_auth.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<MoreThanOneAuthFoundForUserException>()),
      );
    });

    test('impersonatingErrorForUser', () async {
      final result =
          (await getKubeconfig('invalid_user_impersonating.yaml')).validate();
      expect(result.code, ValidationCode.impersonatingErrorForUser);
      expect(
        () async => (await getKubeconfig('invalid_user_impersonating.yaml'))
            .validate(throwExceptions: true),
        throwsA(isA<ImpersonatingErrorForUserException>()),
      );
    });
  });

  group('KubeconfigException', () {
    const kubeconfigException = KubeconfigException(
      code: ValidationCode.contextsRequired,
      message: '"contexts" was not found',
    );
    test('can be instantiated and all props are valid', () {
      expect(kubeconfigException, isNotNull);
      expect(kubeconfigException.props, isNotNull);
      expect(kubeconfigException.toString(), isNotNull);
    });
  });
}
