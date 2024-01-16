// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthInfoCWProxy {
  AuthInfo authProvider(AuthProviderConfig? authProvider);

  AuthInfo clientCertificate(String? clientCertificate);

  AuthInfo clientCertificateData(String? clientCertificateData);

  AuthInfo clientKey(String? clientKey);

  AuthInfo clientKeyData(String? clientKeyData);

  AuthInfo exec(Exec? exec);

  AuthInfo impersonate(String? impersonate);

  AuthInfo impersonateUID(String? impersonateUID);

  AuthInfo impersonateGroups(List<String>? impersonateGroups);

  AuthInfo impersonateUserExtra(
      Map<String, List<String>>? impersonateUserExtra);

  AuthInfo password(String? password);

  AuthInfo token(String? token);

  AuthInfo tokenFile(String? tokenFile);

  AuthInfo username(String? username);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthInfo call({
    AuthProviderConfig? authProvider,
    String? clientCertificate,
    String? clientCertificateData,
    String? clientKey,
    String? clientKeyData,
    Exec? exec,
    String? impersonate,
    String? impersonateUID,
    List<String>? impersonateGroups,
    Map<String, List<String>>? impersonateUserExtra,
    String? password,
    String? token,
    String? tokenFile,
    String? username,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthInfo.copyWith.fieldName(...)`
class _$AuthInfoCWProxyImpl implements _$AuthInfoCWProxy {
  const _$AuthInfoCWProxyImpl(this._value);

  final AuthInfo _value;

  @override
  AuthInfo authProvider(AuthProviderConfig? authProvider) =>
      this(authProvider: authProvider);

  @override
  AuthInfo clientCertificate(String? clientCertificate) =>
      this(clientCertificate: clientCertificate);

  @override
  AuthInfo clientCertificateData(String? clientCertificateData) =>
      this(clientCertificateData: clientCertificateData);

  @override
  AuthInfo clientKey(String? clientKey) => this(clientKey: clientKey);

  @override
  AuthInfo clientKeyData(String? clientKeyData) =>
      this(clientKeyData: clientKeyData);

  @override
  AuthInfo exec(Exec? exec) => this(exec: exec);

  @override
  AuthInfo impersonate(String? impersonate) => this(impersonate: impersonate);

  @override
  AuthInfo impersonateUID(String? impersonateUID) =>
      this(impersonateUID: impersonateUID);

  @override
  AuthInfo impersonateGroups(List<String>? impersonateGroups) =>
      this(impersonateGroups: impersonateGroups);

  @override
  AuthInfo impersonateUserExtra(
          Map<String, List<String>>? impersonateUserExtra) =>
      this(impersonateUserExtra: impersonateUserExtra);

  @override
  AuthInfo password(String? password) => this(password: password);

  @override
  AuthInfo token(String? token) => this(token: token);

  @override
  AuthInfo tokenFile(String? tokenFile) => this(tokenFile: tokenFile);

  @override
  AuthInfo username(String? username) => this(username: username);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthInfo call({
    Object? authProvider = const $CopyWithPlaceholder(),
    Object? clientCertificate = const $CopyWithPlaceholder(),
    Object? clientCertificateData = const $CopyWithPlaceholder(),
    Object? clientKey = const $CopyWithPlaceholder(),
    Object? clientKeyData = const $CopyWithPlaceholder(),
    Object? exec = const $CopyWithPlaceholder(),
    Object? impersonate = const $CopyWithPlaceholder(),
    Object? impersonateUID = const $CopyWithPlaceholder(),
    Object? impersonateGroups = const $CopyWithPlaceholder(),
    Object? impersonateUserExtra = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? tokenFile = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
  }) {
    return AuthInfo(
      authProvider: authProvider == const $CopyWithPlaceholder()
          ? _value.authProvider
          // ignore: cast_nullable_to_non_nullable
          : authProvider as AuthProviderConfig?,
      clientCertificate: clientCertificate == const $CopyWithPlaceholder()
          ? _value.clientCertificate
          // ignore: cast_nullable_to_non_nullable
          : clientCertificate as String?,
      clientCertificateData:
          clientCertificateData == const $CopyWithPlaceholder()
              ? _value.clientCertificateData
              // ignore: cast_nullable_to_non_nullable
              : clientCertificateData as String?,
      clientKey: clientKey == const $CopyWithPlaceholder()
          ? _value.clientKey
          // ignore: cast_nullable_to_non_nullable
          : clientKey as String?,
      clientKeyData: clientKeyData == const $CopyWithPlaceholder()
          ? _value.clientKeyData
          // ignore: cast_nullable_to_non_nullable
          : clientKeyData as String?,
      exec: exec == const $CopyWithPlaceholder()
          ? _value.exec
          // ignore: cast_nullable_to_non_nullable
          : exec as Exec?,
      impersonate: impersonate == const $CopyWithPlaceholder()
          ? _value.impersonate
          // ignore: cast_nullable_to_non_nullable
          : impersonate as String?,
      impersonateUID: impersonateUID == const $CopyWithPlaceholder()
          ? _value.impersonateUID
          // ignore: cast_nullable_to_non_nullable
          : impersonateUID as String?,
      impersonateGroups: impersonateGroups == const $CopyWithPlaceholder()
          ? _value.impersonateGroups
          // ignore: cast_nullable_to_non_nullable
          : impersonateGroups as List<String>?,
      impersonateUserExtra: impersonateUserExtra == const $CopyWithPlaceholder()
          ? _value.impersonateUserExtra
          // ignore: cast_nullable_to_non_nullable
          : impersonateUserExtra as Map<String, List<String>>?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
      tokenFile: tokenFile == const $CopyWithPlaceholder()
          ? _value.tokenFile
          // ignore: cast_nullable_to_non_nullable
          : tokenFile as String?,
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String?,
    );
  }
}

extension $AuthInfoCopyWith on AuthInfo {
  /// Returns a callable class that can be used as follows: `instanceOfAuthInfo.copyWith(...)` or like so:`instanceOfAuthInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthInfoCWProxy get copyWith => _$AuthInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthInfo _$AuthInfoFromJson(Map<String, dynamic> json) => AuthInfo(
      authProvider: json['auth-provider'] == null
          ? null
          : AuthProviderConfig.fromJson(
              json['auth-provider'] as Map<String, dynamic>),
      clientCertificate: json['client-certificate'] as String?,
      clientCertificateData: json['client-certificate-data'] as String?,
      clientKey: json['client-key'] as String?,
      clientKeyData: json['client-key-data'] as String?,
      exec: json['exec'] == null
          ? null
          : Exec.fromJson(json['exec'] as Map<String, dynamic>),
      impersonate: json['as'] as String?,
      impersonateUID: json['as-uid'] as String?,
      impersonateGroups: (json['as-groups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      impersonateUserExtra:
          (json['as-user-extra'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      password: json['password'] as String?,
      token: json['token'] as String?,
      tokenFile: json['tokenFile'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$AuthInfoToJson(AuthInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('auth-provider', instance.authProvider);
  writeNotNull('client-certificate', instance.clientCertificate);
  writeNotNull('client-certificate-data', instance.clientCertificateData);
  writeNotNull('client-key', instance.clientKey);
  writeNotNull('client-key-data', instance.clientKeyData);
  writeNotNull('exec', instance.exec);
  writeNotNull('as', instance.impersonate);
  writeNotNull('as-groups', instance.impersonateGroups);
  writeNotNull('as-uid', instance.impersonateUID);
  writeNotNull('as-user-extra', instance.impersonateUserExtra);
  writeNotNull('password', instance.password);
  writeNotNull('token', instance.token);
  writeNotNull('tokenFile', instance.tokenFile);
  writeNotNull('username', instance.username);
  return val;
}
