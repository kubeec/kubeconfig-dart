import 'dart:convert';

import 'package:kubeconfig/kubeconfig.dart';
import 'package:test/test.dart';

void main() {
  group('Kubeconfig', () {
    const authProviderConfig = AuthProviderConfig(
      name: 'name',
      config: {'key': 'value'},
    );
    const execEnv = ExecEnv(
      name: 'name',
      value: 'value',
    );
    const exec = Exec(
      command: 'command',
      apiVersion: 'client.authentication.k8s.io/v1',
      interactiveMode: InteractiveMode.IfAvailable,
      args: ['arg'],
      env: [execEnv],
      installHint: 'installHint line1\ninstallHint line2',
      provideClusterInfo: false,
    );
    const authInfo = AuthInfo(
      authProvider: authProviderConfig,
      clientCertificate: 'certificate-file-path',
      clientCertificateData: 'certificate-data',
      clientKey: 'client-key-file-path',
      clientKeyData: 'client-key-data',
      exec: exec,
      impersonate: 'impersonate',
      impersonateGroups: ['impersonate-group'],
      impersonateUID: 'impersonate-uid',
      impersonateUserExtra: {
        'key': ['value'],
      },
      password: 'password',
      token: 'token',
      tokenFile: 'token-file-path',
      username: 'username',
    );
    const cluster = Cluster(
      certificateAuthority: 'certificate-authority-file-path',
      certificateAuthorityData: 'certificate-authority-data',
      disableCompression: false,
      insecureSkipTlsVerify: false,
      proxyURL: 'proxy-url',
      server: 'server',
      tlsServerName: 'tls-server-name',
    );
    const context = Context(
      cluster: 'cluster',
      authInfo: 'user',
      namespace: 'namespace',
    );
    const namedAuthInfo = NamedAuthInfo(
      name: 'name',
      user: authInfo,
    );
    const namedCluster = NamedCluster(
      name: 'name',
      cluster: cluster,
    );
    const namedContext = NamedContext(
      name: 'name',
      context: context,
    );
    const preferences = Preferences(
      colors: true,
    );
    const kubeconfig = Kubeconfig(
      apiVersion: 'v1',
      authInfos: [namedAuthInfo],
      clusters: [namedCluster],
      contexts: [namedContext],
      currentContext: 'example',
      kind: 'Config',
      preferences: preferences,
    );

    test('can be instantiated and all props are valid', () {
      expect(authProviderConfig, isNotNull);
      expect(authProviderConfig.props, isNotNull);
      expect(authProviderConfig.toString(), isNotNull);

      expect(execEnv, isNotNull);
      expect(execEnv.props, isNotNull);
      expect(execEnv.toString(), isNotNull);

      expect(exec, isNotNull);
      expect(exec.props, isNotNull);
      expect(exec.toString(), isNotNull);

      expect(authInfo, isNotNull);
      expect(authInfo.props, isNotNull);
      expect(authInfo.toString(), isNotNull);

      expect(cluster, isNotNull);
      expect(cluster.props, isNotNull);
      expect(cluster.toString(), isNotNull);

      expect(context, isNotNull);
      expect(context.props, isNotNull);
      expect(context.toString(), isNotNull);

      expect(namedAuthInfo, isNotNull);
      expect(namedAuthInfo.props, isNotNull);
      expect(namedAuthInfo.toString(), isNotNull);

      expect(namedCluster, isNotNull);
      expect(namedCluster.props, isNotNull);
      expect(namedCluster.toString(), isNotNull);

      expect(namedContext, isNotNull);
      expect(namedContext.props, isNotNull);
      expect(namedContext.toString(), isNotNull);

      expect(preferences, isNotNull);
      expect(preferences.props, isNotNull);
      expect(preferences.toString(), isNotNull);

      expect(kubeconfig, isNotNull);
      expect(kubeconfig.props, isNotNull);
      expect(kubeconfig.toString(), isNotNull);
    });

    test('can be instantiated with null or default values', () {
      const kubeconfig =
          Kubeconfig(authInfos: null, clusters: null, contexts: null);
      expect(kubeconfig, isNotNull);
    });

    group('json', () {
      final kubeconfigJson = json.encode(kubeconfig.toJson());

      test('toJson() converts a kubeconfig object to json', () {
        expect(kubeconfigJson, isNotNull);
      });

      test('fromJson() creates an instance with a valid yaml', () {
        final kubeconfigFromJson = Kubeconfig.fromJson(
          json.decode(kubeconfigJson) as Map<String, dynamic>,
        );
        expect(kubeconfigFromJson, isNotNull);
      });
    });

    group('yaml', () {
      final kubeconfigYaml = kubeconfig.toYaml();

      test('toYaml() converts a kubeconfig object to yaml', () {
        expect(kubeconfigYaml, isNotNull);
      });

      test('fromYaml() throws YamlException if the yaml is empty', () {
        expect(
          () => Kubeconfig.fromYaml(''),
          throwsA(isA<YamlException>()),
        );
      });

      test('fromYaml() throws YamlException if the yaml is not valid', () {
        expect(
          () => Kubeconfig.fromYaml('`invalid`'),
          throwsA(isA<YamlException>()),
        );
      });

      test('fromYaml() creates an instance with a valid yaml', () {
        final kubeconfig = Kubeconfig.fromYaml(kubeconfigYaml);
        expect(kubeconfig, isNotNull);
      });
    });

    group('ValidationResult', () {
      const validationResult = ValidationResult(
        code: ValidationCode.valid,
        description: 'description',
      );
      final validationResultJson = json.encode(validationResult.toJson());
      final validationResultCopy = validationResult.copyWith(
        code: ValidationCode.contextsRequired,
        description: 'description2',
      );
      final validationResultClone = validationResult.copyWith();
      final validationResultCopyWithCode =
          validationResult.copyWith.code(ValidationCode.contextsRequired);
      final validationResultCopyWithDescription =
          validationResult.copyWith.description('description2');

      test('can be instantiated and all props are valid', () {
        expect(validationResult, isNotNull);
        expect(validationResult.props, isNotNull);
        expect(validationResult.toString(), isNotNull);
      });

      test('can be converted to json with Kubeconfig.toJson()', () {
        expect(validationResultJson, isNotNull);
      });

      test('can be instantiated with ValidationResult.fromJson()', () {
        final validationResultFromJson = ValidationResult.fromJson(
          json.decode(validationResultJson) as Map<String, dynamic>,
        );
        expect(validationResultFromJson, isNotNull);
      });

      test('can be instantiated with copyWith()', () {
        expect(validationResultCopy, isNotNull);
        expect(validationResultClone, isNotNull);
        expect(validationResultCopyWithCode, isNotNull);
        expect(validationResultCopyWithDescription, isNotNull);
      });
    });

    group('copyWith', () {
      final authProviderConfigCopy = authProviderConfig.copyWith(
        name: 'name2',
        config: {'key2': 'value2'},
      );
      final execEnvCopy = execEnv.copyWith(
        name: 'name2',
        value: 'value2',
      );
      final execCopy = exec.copyWith(
        command: 'command2',
        apiVersion: 'client.authentication.k8s.io/v1beta1',
        interactiveMode: InteractiveMode.Never,
        args: ['arg2'],
        env: [execEnvCopy],
        installHint: 'installHint2 line1\ninstallHint2 line2',
        provideClusterInfo: false,
      );
      final authInfoCopy = authInfo.copyWith(
        authProvider: authProviderConfigCopy,
        clientCertificate: 'certificate-file-path2',
        clientCertificateData: 'certificate-data2',
        clientKey: 'client-key-file-path2',
        clientKeyData: 'client-key-data2',
        exec: execCopy,
        impersonate: 'impersonate2',
        impersonateGroups: ['impersonate-group2'],
        impersonateUID: 'impersonate-uid2',
        impersonateUserExtra: {
          'key2': ['value2'],
        },
        password: 'password2',
        token: 'token2',
        tokenFile: 'token-file-path2',
        username: 'username2',
      );
      final clusterCopy = cluster.copyWith(
        certificateAuthority: 'certificate-authority-file-path2',
        certificateAuthorityData: 'certificate-authority-data2',
        disableCompression: false,
        insecureSkipTlsVerify: false,
        proxyURL: 'proxy-url2',
        server: 'server2',
        tlsServerName: 'tls-server-name2',
      );
      final contextCopy = context.copyWith(
        cluster: 'cluster2',
        authInfo: 'user2',
        namespace: 'namespace2',
      );
      final namedAuthInfoCopy = namedAuthInfo.copyWith(
        name: 'name2',
        user: authInfoCopy,
      );
      final namedClusterCopy = namedCluster.copyWith(
        name: 'name2',
        cluster: clusterCopy,
      );
      final namedContextCopy = namedContext.copyWith(
        name: 'name2',
        context: contextCopy,
      );
      final preferencesCopy = preferences.copyWith(
        colors: false,
      );
      final kubeconfigCopy = kubeconfig.copyWith(
        apiVersion: 'v1',
        authInfos: [namedAuthInfoCopy],
        clusters: [namedClusterCopy],
        contexts: [namedContextCopy],
        currentContext: 'example2',
        kind: 'Config',
        preferences: preferencesCopy,
      );

      final authProviderConfigClone = authProviderConfig.copyWith();
      final execEnvClone = execEnv.copyWith();
      final execClone = exec.copyWith();
      final authInfoClone = authInfo.copyWith();
      final clusterClone = cluster.copyWith();
      final contextClone = context.copyWith();
      final namedAuthInfoClone = namedAuthInfo.copyWith();
      final namedClusterClone = namedCluster.copyWith();
      final namedContextClone = namedContext.copyWith();
      final preferencesClone = preferences.copyWith();
      final kubeconfigClone = kubeconfig.copyWith();

      final authProviderConfigCopyWithName =
          authProviderConfig.copyWith.name('name2');
      final authProviderConfigCopyWithConfig =
          authProviderConfig.copyWith.config({'key2': 'value2'});
      final execEnvCopyWithName = execEnv.copyWith.name('name2');
      final execEnvCopyWithValue = execEnv.copyWith.value('value2');
      final execCopyWithCommand = exec.copyWith.command('command2');
      final execCopyWithApiVersion =
          exec.copyWith.apiVersion('client.authentication.k8s.io/v1beta1');
      final execCopyWithInteractiveMode =
          exec.copyWith.interactiveMode(InteractiveMode.Never);
      final execCopyWithArgs = exec.copyWith.args(['arg2']);
      final execCopyWithEnv = exec.copyWith.env([execEnvCopy]);
      final execCopyWithInstallHint =
          exec.copyWith.installHint('installHint2 line1\ninstallHint2 line2');
      final execCopyWithProvideClusterInfo =
          exec.copyWith.provideClusterInfo(false);
      final authInfoCopyWithAuthProvider =
          authInfo.copyWith.authProvider(authProviderConfigCopy);
      final authInfoCopyWithClientCertificate =
          authInfo.copyWith.clientCertificate('certificate-file-path2');
      final authInfoCopyWithClientCertificateData =
          authInfo.copyWith.clientCertificateData('certificate-data2');
      final authInfoCopyWithClientKey =
          authInfo.copyWith.clientKey('client-key-file-path2');
      final authInfoCopyWithClientKeyData =
          authInfo.copyWith.clientKeyData('client-key-data2');
      final authInfoCopyWithExec = authInfo.copyWith.exec(execCopy);
      final authInfoCopyWithImpersonate =
          authInfo.copyWith.impersonate('impersonate2');
      final authInfoCopyWithImpersonateGroups =
          authInfo.copyWith.impersonateGroups(['impersonate-group2']);
      final authInfoCopyWithImpersonateUID =
          authInfo.copyWith.impersonateUID('impersonate-uid2');
      final authInfoCopyWithImpersonateUserExtra =
          authInfo.copyWith.impersonateUserExtra({
        'key2': ['value2'],
      });
      final authInfoCopyWithPassword = authInfo.copyWith.password('password2');
      final authInfoCopyWithToken = authInfo.copyWith.token('token2');
      final authInfoCopyWithTokenFile =
          authInfo.copyWith.tokenFile('token-file-path2');
      final authInfoCopyWithUsername = authInfo.copyWith.username('username2');
      final clusterCopyWithCertificateAuthority = cluster.copyWith
          .certificateAuthority('certificate-authority-file-path2');
      final clusterCopyWithCertificateAuthorityData = cluster.copyWith
          .certificateAuthorityData('certificate-authority-data2');
      final clusterCopyWithDisableCompression =
          cluster.copyWith.disableCompression(false);
      final clusterCopyWithInsecureSkipTlsVerify =
          cluster.copyWith.insecureSkipTlsVerify(false);
      final clusterCopyWithProxyURL = cluster.copyWith.proxyURL('proxy-url2');
      final clusterCopyWithServer = cluster.copyWith.server('server2');
      final clusterCopyWithTlsServerName =
          cluster.copyWith.tlsServerName('tls-server-name2');
      final contextCopyWithCluster = context.copyWith.cluster('cluster2');
      final contextCopyWithAuthInfo = context.copyWith.authInfo('user2');
      final contextCopyWithNamespace = context.copyWith.namespace('namespace2');
      final namedAuthInfoCopyWithName = namedAuthInfo.copyWith.name('name2');
      final namedAuthInfoCopyWithUser =
          namedAuthInfo.copyWith.user(authInfoCopy);
      final namedClusterCopyWithName = namedCluster.copyWith.name('name2');
      final namedClusterCopyWithCluster =
          namedCluster.copyWith.cluster(clusterCopy);
      final namedContextCopyWithName = namedContext.copyWith.name('name2');
      final namedContextCopyWithContext =
          namedContext.copyWith.context(contextCopy);
      final preferencesCopyWithColors = preferences.copyWith.colors(false);
      final kubeconfigCopyWithApiVersion = kubeconfig.copyWith.apiVersion('v1');
      final kubeconfigCopyWithAuthInfos =
          kubeconfig.copyWith.authInfos([namedAuthInfoCopy]);
      final kubeconfigCopyWithClusters =
          kubeconfig.copyWith.clusters([namedClusterCopy]);
      final kubeconfigCopyWithContexts =
          kubeconfig.copyWith.contexts([namedContextCopy]);
      final kubeconfigCopyWithCurrentContext =
          kubeconfig.copyWith.currentContext('example2');
      final kubeconfigCopyWithKind = kubeconfig.copyWith.kind('Config');
      final kubeconfigCopyWithPreferences =
          kubeconfig.copyWith.preferences(preferencesCopy);

      test('creates a new copy object', () {
        expect(authProviderConfigCopy, isNotNull);
        expect(execEnvCopy, isNotNull);
        expect(execCopy, isNotNull);
        expect(authInfoCopy, isNotNull);
        expect(clusterCopy, isNotNull);
        expect(contextCopy, isNotNull);
        expect(namedAuthInfoCopy, isNotNull);
        expect(namedClusterCopy, isNotNull);
        expect(namedContextCopy, isNotNull);
        expect(preferencesCopy, isNotNull);
        expect(kubeconfigCopy, isNotNull);
      });

      test('creates a clone object', () {
        expect(authProviderConfigClone, isNotNull);
        expect(execEnvClone, isNotNull);
        expect(execClone, isNotNull);
        expect(authInfoClone, isNotNull);
        expect(clusterClone, isNotNull);
        expect(contextClone, isNotNull);
        expect(namedAuthInfoClone, isNotNull);
        expect(namedClusterClone, isNotNull);
        expect(namedContextClone, isNotNull);
        expect(preferencesClone, isNotNull);
        expect(kubeconfigClone, isNotNull);
      });

      test('creates a new copy object with the specified fields', () {
        expect(authProviderConfigCopyWithName, isNotNull);
        expect(authProviderConfigCopyWithConfig, isNotNull);
        expect(execEnvCopyWithName, isNotNull);
        expect(execEnvCopyWithValue, isNotNull);
        expect(execCopyWithCommand, isNotNull);
        expect(execCopyWithApiVersion, isNotNull);
        expect(execCopyWithInteractiveMode, isNotNull);
        expect(execCopyWithArgs, isNotNull);
        expect(execCopyWithEnv, isNotNull);
        expect(execCopyWithInstallHint, isNotNull);
        expect(execCopyWithProvideClusterInfo, isNotNull);
        expect(authInfoCopyWithAuthProvider, isNotNull);
        expect(authInfoCopyWithClientCertificate, isNotNull);
        expect(authInfoCopyWithClientCertificateData, isNotNull);
        expect(authInfoCopyWithClientKey, isNotNull);
        expect(authInfoCopyWithClientKeyData, isNotNull);
        expect(authInfoCopyWithExec, isNotNull);
        expect(authInfoCopyWithImpersonate, isNotNull);
        expect(authInfoCopyWithImpersonateGroups, isNotNull);
        expect(authInfoCopyWithImpersonateUID, isNotNull);
        expect(authInfoCopyWithImpersonateUserExtra, isNotNull);
        expect(authInfoCopyWithPassword, isNotNull);
        expect(authInfoCopyWithToken, isNotNull);
        expect(authInfoCopyWithTokenFile, isNotNull);
        expect(authInfoCopyWithUsername, isNotNull);
        expect(clusterCopyWithCertificateAuthority, isNotNull);
        expect(clusterCopyWithCertificateAuthorityData, isNotNull);
        expect(clusterCopyWithDisableCompression, isNotNull);
        expect(clusterCopyWithInsecureSkipTlsVerify, isNotNull);
        expect(clusterCopyWithProxyURL, isNotNull);
        expect(clusterCopyWithServer, isNotNull);
        expect(clusterCopyWithTlsServerName, isNotNull);
        expect(contextCopyWithCluster, isNotNull);
        expect(contextCopyWithAuthInfo, isNotNull);
        expect(contextCopyWithNamespace, isNotNull);
        expect(namedAuthInfoCopyWithName, isNotNull);
        expect(namedAuthInfoCopyWithUser, isNotNull);
        expect(namedClusterCopyWithName, isNotNull);
        expect(namedClusterCopyWithCluster, isNotNull);
        expect(namedContextCopyWithName, isNotNull);
        expect(namedContextCopyWithContext, isNotNull);
        expect(preferencesCopyWithColors, isNotNull);
        expect(kubeconfigCopyWithApiVersion, isNotNull);
        expect(kubeconfigCopyWithAuthInfos, isNotNull);
        expect(kubeconfigCopyWithClusters, isNotNull);
        expect(kubeconfigCopyWithContexts, isNotNull);
        expect(kubeconfigCopyWithCurrentContext, isNotNull);
        expect(kubeconfigCopyWithKind, isNotNull);
        expect(kubeconfigCopyWithPreferences, isNotNull);
      });
    });
  });
}
