import 'dart:io';

import 'package:kubeconfig/kubeconfig.dart';
import 'package:test/test.dart';

Future<void> main() async {
  Future<Kubeconfig> getKubeconfig(String file) async {
    final kubeconfigYaml = await File('test/files/$file').readAsString();
    final kubeconfig = Kubeconfig.fromYaml(kubeconfigYaml);
    return kubeconfig;
  }

  final kubeconfigValid1 = await getKubeconfig('valid.yaml');
  final kubeconfigValid2 = await getKubeconfig('valid_multi.yaml');
  final kubeconfigInvalid1 =
      await getKubeconfig('invalid_cluster_certificate_both.yaml');
  final kubeconfigInvalid2 =
      await getKubeconfig('invalid_user_multi_auth.yaml');

  group('Kubeconfig merge()', () {
    test('creates an instance with valid kubeconfig objects', () {
      final kubeconfigMerged = kubeconfigValid1.merge(kubeconfigValid2);
      expect(kubeconfigMerged, isNotNull);
      expect(kubeconfigMerged!.contexts!.length, 10);
    });

    test('cannot merge with invalid kubeconfig objects', () {
      final kubeconfigNotMerged = kubeconfigInvalid1.merge(kubeconfigInvalid2);
      expect(kubeconfigNotMerged, isNull);
    });

    test('throws an exception with an invalid source kubeconfig object', () {
      expect(
        () => kubeconfigInvalid1.merge(
          kubeconfigValid1,
          throwExceptions: true,
        ),
        throwsA(isA<KubeconfigException>()),
      );
    });

    test('throws an exception with an invalid target kubeconfig object', () {
      expect(
        () => kubeconfigValid1.merge(
          kubeconfigInvalid1,
          throwExceptions: true,
        ),
        throwsA(isA<KubeconfigException>()),
      );
    });

    test('throws an exception with invalid kubeconfig objects', () {
      expect(
        () => kubeconfigInvalid1.merge(
          kubeconfigInvalid2,
          throwExceptions: true,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test('preserves current context', () {
      final kubeconfigMerged = kubeconfigValid1.merge(
        kubeconfigValid2,
        preserveCurrentContext: true,
      );
      expect(kubeconfigMerged!.currentContext, kubeconfigValid1.currentContext);
    });
  });
}
