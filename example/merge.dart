import 'dart:async';
import 'dart:io';

import 'package:kubeconfig/kubeconfig.dart';

Future<void> main() async {
  try {
    final yaml1 = await File('test/files/valid_multi.yaml').readAsString();
    final yaml2 = await File('test/files/valid.yaml').readAsString();
    final kubeconfig1 = Kubeconfig.fromYaml(yaml1);
    final kubeconfig2 = Kubeconfig.fromYaml(yaml2);
    final kubeconfigMerged = kubeconfig1.merge(kubeconfig2);

    if (kubeconfigMerged != null) {
      print('Context Count: ${kubeconfigMerged.contexts?.length}');
    } else {
      print('Cannot merged. One or both kubeconfig is not valid.');
    }
    exit(0);
  } on YamlException {
    print('Invalid YAML content.');
    exit(65);
  } on FileSystemException {
    print('File does not exist or could not be read.');
    exit(74);
  } catch (e) {
    print('An unexpected error occurred.');
    exit(70);
  }
}

// ignore_for_file: avoid_print
