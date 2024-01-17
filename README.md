[![Kubeconfig Logo][kubeconfig_logo]][kubeconfig_link]

[![CI][ci_badge]][ci_link]
[![Coverage][coverage_badge]][coverage_link]
[![License: MIT][license_badge]][license_link]
[![pub][pub_badge]][pub_link]
[![npm][npm_badge]][npm_link]

---
A library that simplifies the management of kubeconfig files. It offers a bunch of features, such as validating, merging, and converting kubeconfig files, to ensure that you have a consistent and optimized configuration for accessing multiple Kubernetes clusters.

Developed with 💙 by [Fatih Sever][fatihsever_link]

## Features ✨
- **Validate**: Check the syntax and structure of kubeconfig files for common errors or inconsistencies.
- **Convert**: Convert between different formats (YAML to JSON or JSON to YAML).
- **Merge**: Combine multiple kubeconfig files into a single file, preserving context and cluster information, and avoiding duplication.

## Documentation 📝
Please visit the [official documentation][docs_link].

## Installation 💻
### From npm:
`kubeconfig` compiled to JavaScript, as an npm package. You can add it to your project using the command below.
```bash
npm install --save kubeconfig
```

For more information, please visit the [npmjs.com](https://www.npmjs.com/package/kubeconfig)

### From pub:
For quick start, please include the following in pubspec.yaml
```yaml
dependencies:
  kubeconfig: 1.0.0+1
```
For more information, please visit the [pub.dev](https://pub.dev/packages/kubeconfig/install)

## Quick Start 🚀

Validating a kubeconfig file:

### JavaScript:
```javascript
import { readFileSync } from 'fs';
import { Kubeconfig } from './kubeconfig';

let kubeconfigYaml = readFileSync('kube/config.yaml');
let kubeconfig = Kubeconfig.fromYaml(kubeconfigYaml);
let validationResult = kubeconfig.validate();
```

### Dart:
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
### Javascript:
- **Validate**: [example/js/validate.js](example/validate.js)
- **Convert**: [example/js/validate.js](example/validate.js)
- **Merge**: [example/js/validate.js](example/validate.js)

### Dart:
- **Validate**: [example/dart/validate.dart](example/validate.dart)
- **Convert**: [example/dart/convert.dart](example/convert.dart)
- **Merge**: [example/dart/merge.dart](example/merge.dart)

[kubeconfig_logo]: https://raw.githubusercontent.com/fatihsever/kubeconfig-lib/main/assets/logo.svg
[kubeconfig_link]: https://fatihsever.github.io/kubeconfig-lib/
[ci_badge]: https://github.com/fatihsever/kubeconfig-lib/actions/workflows/ci.yml/badge.svg?branch=main
[ci_link]: https://github.com/fatihsever/kubeconfig-lib/actions/workflows/ci.yml
[coverage_badge]: https://codecov.io/github/fatihsever/kubeconfig-lib/badges/coverage.svg?branch=main
[coverage_link]: https://codecov.io/github/fatihsever/kubeconfig-lib/badges?branch=master
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[pub_badge]: https://img.shields.io/pub/v/kubeconfig
[pub_link]: https://pub.dev/packages/kubeconfig
[npm_badge]: https://img.shields.io/npm/v/kubeconfig
[npm_link]: https://www.npmjs.com/package/kubeconfig
[fatihsever_link]: https://fatihsever.com/
[docs_link]: https://fatihsever.github.io/kubeconfig-lib/
