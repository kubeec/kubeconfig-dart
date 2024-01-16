import 'dart:async';
import 'dart:io';

import 'package:kubeconfig/kubeconfig.dart';

Future<void> main() async {
  final kubeconfigYaml =
      await File('test/files/invalid_current_context.yaml').readAsString();
  final kubeconfig = Kubeconfig.fromYaml(kubeconfigYaml);
  final validationResult = kubeconfig.validate();

  if (validationResult.code != ValidationCode.valid) {
    print('${validationResult.description}');
  }
}

// ignore_for_file: avoid_print
