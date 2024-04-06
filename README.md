[![Kubeconfig Logo][kubeconfig_logo]][kubeconfig_link]

[![CI][ci_badge]][ci_link]
[![Coverage][coverage_badge]][coverage_link]
[![License: MIT][license_badge]][license_link]
[![pub][pub_badge]][pub_link]

---

A library that simplifies the management of kubeconfig files. It offers a bunch of features, such as validating, merging, and converting kubeconfig files, to ensure that you have a consistent and optimized configuration for accessing multiple Kubernetes clusters.

Developed with 💙 by Kubeec Team

## Features ✨

- **Validate**: Check the syntax and structure of kubeconfig files for common errors or inconsistencies.
- **Convert**: Convert between different formats (YAML to JSON or JSON to YAML).
- **Merge**: Combine multiple kubeconfig files into a single file, preserving context and cluster information, and avoiding duplication.

## Installation 💻

For quick start, please use this package as a library

With Dart:

```sh
dart pub add kubeconfig
```

With Flutter:

```sh
flutter pub add kubeconfig
```

For more information, please visit the [pub.dev](https://pub.dev/packages/kubeconfig/install)

## Quick Start 🚀

Validating a kubeconfig file:

```dart
import 'dart:io';
import 'package:kubeconfig/kubeconfig.dart';

void main() {
  final kubeconfigYaml = await File('kube/config.yaml').readAsString();
  final kubeconfig = Kubeconfig.fromYaml(kubeconfigYaml);
  final validationResult = kubeconfig.validate();
}
```

## Examples 📋

```sh
dart example/example.dart
```

- **Validate**: [example/validate.dart](example/validate.dart)
- **Convert**: [example/convert.dart](example/convert.dart)
- **Merge**: [example/merge.dart](example/merge.dart)

```sh
dart example/validate.dart
dart example/convert.dart
dart example/merge.dart
```

[kubeconfig_logo]: https://raw.githubusercontent.com/kubeec/kubeconfig-dart/main/assets/logo.svg
[kubeconfig_link]: https://github.com/kubeec/kubeconfig-dart
[ci_badge]: https://github.com/kubeec/kubeconfig-dart/actions/workflows/ci.yml/badge.svg?branch=main
[ci_link]: https://github.com/kubeec/kubeconfig-dart/actions/workflows/ci.yml
[coverage_badge]: https://codecov.io/github/kubeec/kubeconfig-dart/graph/badge.svg?token=HJNIIKONS2
[coverage_link]: https://codecov.io/github/kubeec/kubeconfig-dart
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[pub_badge]: https://img.shields.io/pub/v/kubeconfig
[pub_link]: https://pub.dev/packages/kubeconfig
