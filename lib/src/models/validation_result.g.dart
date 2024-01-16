// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_result.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ValidationResultCWProxy {
  ValidationResult code(ValidationCode code);

  ValidationResult description(String? description);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidationResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidationResult(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidationResult call({
    ValidationCode? code,
    String? description,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfValidationResult.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfValidationResult.copyWith.fieldName(...)`
class _$ValidationResultCWProxyImpl implements _$ValidationResultCWProxy {
  const _$ValidationResultCWProxyImpl(this._value);

  final ValidationResult _value;

  @override
  ValidationResult code(ValidationCode code) => this(code: code);

  @override
  ValidationResult description(String? description) =>
      this(description: description);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ValidationResult(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ValidationResult(...).copyWith(id: 12, name: "My name")
  /// ````
  ValidationResult call({
    Object? code = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
  }) {
    return ValidationResult(
      code: code == const $CopyWithPlaceholder() || code == null
          ? _value.code
          // ignore: cast_nullable_to_non_nullable
          : code as ValidationCode,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
    );
  }
}

extension $ValidationResultCopyWith on ValidationResult {
  /// Returns a callable class that can be used as follows: `instanceOfValidationResult.copyWith(...)` or like so:`instanceOfValidationResult.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ValidationResultCWProxy get copyWith => _$ValidationResultCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidationResult _$ValidationResultFromJson(Map<String, dynamic> json) =>
    ValidationResult(
      code: $enumDecode(_$ValidationCodeEnumMap, json['code']),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ValidationResultToJson(ValidationResult instance) {
  final val = <String, dynamic>{
    'code': _$ValidationCodeEnumMap[instance.code]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  return val;
}

const _$ValidationCodeEnumMap = {
  ValidationCode.valid: 'valid',
  ValidationCode.clustersRequired: 'clustersRequired',
  ValidationCode.contextsRequired: 'contextsRequired',
  ValidationCode.usersRequired: 'usersRequired',
  ValidationCode.nameRequiredForNamedCluster: 'nameRequiredForNamedCluster',
  ValidationCode.nameRequiredForNamedContext: 'nameRequiredForNamedContext',
  ValidationCode.nameRequiredForNamedUser: 'nameRequiredForNamedUser',
  ValidationCode.clusterRequiredForNamedCluster:
      'clusterRequiredForNamedCluster',
  ValidationCode.contextRequiredForNamedContext:
      'contextRequiredForNamedContext',
  ValidationCode.userRequiredForNamedUser: 'userRequiredForNamedUser',
  ValidationCode.serverRequiredForCluster: 'serverRequiredForCluster',
  ValidationCode.clusterRequiredForContext: 'clusterRequiredForContext',
  ValidationCode.userRequiredForContext: 'userRequiredForContext',
  ValidationCode.namedClusterDuplicate: 'namedClusterDuplicate',
  ValidationCode.namedContextDuplicate: 'namedContextDuplicate',
  ValidationCode.namedUserDuplicate: 'namedUserDuplicate',
  ValidationCode.currentContextNotFound: 'currentContextNotFound',
  ValidationCode.clusterNotFoundForContext: 'clusterNotFoundForContext',
  ValidationCode.userNotFoundForContext: 'userNotFoundForContext',
  ValidationCode.namespaceInvalidMaxLengthForContext:
      'namespaceInvalidMaxLengthForContext',
  ValidationCode.namespaceFormatNotMatchForContext:
      'namespaceFormatNotMatchForContext',
  ValidationCode.certificateAuthorityErrorForCluster:
      'certificateAuthorityErrorForCluster',
  ValidationCode.certificateAuthorityFileErrorForCluster:
      'certificateAuthorityFileErrorForCluster',
  ValidationCode.proxyUrlInvalidForCluster: 'proxyUrlInvalidForCluster',
  ValidationCode.proxyUrlInvalidSchemeForCluster:
      'proxyUrlInvalidSchemeForCluster',
  ValidationCode.clientCertErrorForUser: 'clientCertErrorForUser',
  ValidationCode.clientKeyErrorForUser: 'clientKeyErrorForUser',
  ValidationCode.clientKeyNotFoundForUser: 'clientKeyNotFoundForUser',
  ValidationCode.clientCertFileErrorForUser: 'clientCertFileErrorForUser',
  ValidationCode.clientKeyFileErrorForUser: 'clientKeyFileErrorForUser',
  ValidationCode.authProviderAndExecErrorForUser:
      'authProviderAndExecErrorForUser',
  ValidationCode.execCommandNotFoundForUser: 'execCommandNotFoundForUser',
  ValidationCode.execApiVersionNotFoundForUser: 'execApiVersionNotFoundForUser',
  ValidationCode.execEnvNameNotFoundForUser: 'execEnvNameNotFoundForUser',
  ValidationCode.moreThanOneAuthFoundForUser: 'moreThanOneAuthFoundForUser',
  ValidationCode.impersonatingErrorForUser: 'impersonatingErrorForUser',
};
