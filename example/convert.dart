import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:kubeconfig/kubeconfig.dart';

Future<void> main() async {
  try {
    final kubeconfigJson = await File('test/files/valid.json').readAsString();
    final kubeconfig = Kubeconfig.fromJson(
      json.decode(kubeconfigJson) as Map<String, dynamic>,
    );
    final kubeconfigYaml = kubeconfig.toYaml();

    print(kubeconfigYaml);
    exit(0);
  } on FormatException {
    print('Invalid JSON content.');
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
