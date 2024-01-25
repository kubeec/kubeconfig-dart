import 'dart:async';
import 'dart:io';

import 'package:kubeconfig/kubeconfig.dart';

Future<void> main() async {
  try {
    final kubeconfigYaml = await File('test/files/valid.yaml').readAsString();
    final kubeconfig = Kubeconfig.fromYaml(kubeconfigYaml);
    final validationResult = kubeconfig.validate();

    if (validationResult.code == ValidationCode.valid) {
      print('Context Count: ${kubeconfig.contexts?.length}');
    } else {
      print('Error: ${validationResult.description}');
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
