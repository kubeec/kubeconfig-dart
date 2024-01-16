import 'dart:convert';
import 'package:yaml/yaml.dart';

/// String validation extensions
extension StringValidationX on String? {
  /// Checks a string is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

/// String format extensions
extension StringFormatingX on String {
  /// Replaces the format item in a specified string with the string
  /// representation of a corresponding object in a specified array.
  String format(List<String> values) {
    var formatted = this;
    for (var i = 0; i < values.length; i++) {
      formatted = formatted.replaceAll('{$i}', values[i]);
    }
    return formatted;
  }
}

/// String convert extensions
extension StringConvertX on String? {
  /// Converts a yaml string to json.
  Map<String, dynamic> yamlToJson() {
    if (isNullOrEmpty) {
      throw YamlException('Yaml string cannot be null or empty.', null);
    }
    return json.decode(json.encode(loadYaml(this!))) as Map<String, dynamic>;
  }
}
