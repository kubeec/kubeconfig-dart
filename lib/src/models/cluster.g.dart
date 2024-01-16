// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cluster.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClusterCWProxy {
  Cluster server(String? server);

  Cluster insecureSkipTlsVerify(bool? insecureSkipTlsVerify);

  Cluster certificateAuthority(String? certificateAuthority);

  Cluster certificateAuthorityData(String? certificateAuthorityData);

  Cluster disableCompression(bool? disableCompression);

  Cluster proxyURL(String? proxyURL);

  Cluster tlsServerName(String? tlsServerName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Cluster(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Cluster(...).copyWith(id: 12, name: "My name")
  /// ````
  Cluster call({
    String? server,
    bool? insecureSkipTlsVerify,
    String? certificateAuthority,
    String? certificateAuthorityData,
    bool? disableCompression,
    String? proxyURL,
    String? tlsServerName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCluster.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCluster.copyWith.fieldName(...)`
class _$ClusterCWProxyImpl implements _$ClusterCWProxy {
  const _$ClusterCWProxyImpl(this._value);

  final Cluster _value;

  @override
  Cluster server(String? server) => this(server: server);

  @override
  Cluster insecureSkipTlsVerify(bool? insecureSkipTlsVerify) =>
      this(insecureSkipTlsVerify: insecureSkipTlsVerify);

  @override
  Cluster certificateAuthority(String? certificateAuthority) =>
      this(certificateAuthority: certificateAuthority);

  @override
  Cluster certificateAuthorityData(String? certificateAuthorityData) =>
      this(certificateAuthorityData: certificateAuthorityData);

  @override
  Cluster disableCompression(bool? disableCompression) =>
      this(disableCompression: disableCompression);

  @override
  Cluster proxyURL(String? proxyURL) => this(proxyURL: proxyURL);

  @override
  Cluster tlsServerName(String? tlsServerName) =>
      this(tlsServerName: tlsServerName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Cluster(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Cluster(...).copyWith(id: 12, name: "My name")
  /// ````
  Cluster call({
    Object? server = const $CopyWithPlaceholder(),
    Object? insecureSkipTlsVerify = const $CopyWithPlaceholder(),
    Object? certificateAuthority = const $CopyWithPlaceholder(),
    Object? certificateAuthorityData = const $CopyWithPlaceholder(),
    Object? disableCompression = const $CopyWithPlaceholder(),
    Object? proxyURL = const $CopyWithPlaceholder(),
    Object? tlsServerName = const $CopyWithPlaceholder(),
  }) {
    return Cluster(
      server: server == const $CopyWithPlaceholder()
          ? _value.server
          // ignore: cast_nullable_to_non_nullable
          : server as String?,
      insecureSkipTlsVerify:
          insecureSkipTlsVerify == const $CopyWithPlaceholder()
              ? _value.insecureSkipTlsVerify
              // ignore: cast_nullable_to_non_nullable
              : insecureSkipTlsVerify as bool?,
      certificateAuthority: certificateAuthority == const $CopyWithPlaceholder()
          ? _value.certificateAuthority
          // ignore: cast_nullable_to_non_nullable
          : certificateAuthority as String?,
      certificateAuthorityData:
          certificateAuthorityData == const $CopyWithPlaceholder()
              ? _value.certificateAuthorityData
              // ignore: cast_nullable_to_non_nullable
              : certificateAuthorityData as String?,
      disableCompression: disableCompression == const $CopyWithPlaceholder()
          ? _value.disableCompression
          // ignore: cast_nullable_to_non_nullable
          : disableCompression as bool?,
      proxyURL: proxyURL == const $CopyWithPlaceholder()
          ? _value.proxyURL
          // ignore: cast_nullable_to_non_nullable
          : proxyURL as String?,
      tlsServerName: tlsServerName == const $CopyWithPlaceholder()
          ? _value.tlsServerName
          // ignore: cast_nullable_to_non_nullable
          : tlsServerName as String?,
    );
  }
}

extension $ClusterCopyWith on Cluster {
  /// Returns a callable class that can be used as follows: `instanceOfCluster.copyWith(...)` or like so:`instanceOfCluster.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClusterCWProxy get copyWith => _$ClusterCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cluster _$ClusterFromJson(Map<String, dynamic> json) => Cluster(
      server: json['server'] as String?,
      insecureSkipTlsVerify: json['insecure-skip-tls-verify'] as bool?,
      certificateAuthority: json['certificate-authority'] as String?,
      certificateAuthorityData: json['certificate-authority-data'] as String?,
      disableCompression: json['disable-compression'] as bool?,
      proxyURL: json['proxy-url'] as String?,
      tlsServerName: json['tls-server-name'] as String?,
    );

Map<String, dynamic> _$ClusterToJson(Cluster instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('certificate-authority', instance.certificateAuthority);
  writeNotNull('certificate-authority-data', instance.certificateAuthorityData);
  writeNotNull('disable-compression', instance.disableCompression);
  writeNotNull('insecure-skip-tls-verify', instance.insecureSkipTlsVerify);
  writeNotNull('proxy-url', instance.proxyURL);
  writeNotNull('server', instance.server);
  writeNotNull('tls-server-name', instance.tlsServerName);
  return val;
}
