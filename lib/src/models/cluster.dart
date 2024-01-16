import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'cluster.g.dart';

/// {@template cluster}
/// Cluster contains information about how to communicate with a kubernetes
/// cluster.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class Cluster extends Equatable {
  /// {@macro cluster}
  const Cluster({
    required this.server,
    required this.insecureSkipTlsVerify,
    this.certificateAuthority,
    this.certificateAuthorityData,
    this.disableCompression,
    this.proxyURL,
    this.tlsServerName,
  });

  /// Creates a new instance from json.
  factory Cluster.fromJson(Map<String, dynamic> json) =>
      _$ClusterFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$ClusterToJson(this);

  /// CertificateAuthority is the path to a cert file for the certificate
  /// authority.
  @JsonKey(name: 'certificate-authority')
  final String? certificateAuthority;

  /// CertificateAuthorityData contains PEM-encoded certificate authority
  /// certificates. Overrides CertificateAuthority
  @JsonKey(name: 'certificate-authority-data')
  final String? certificateAuthorityData;

  /// DisableCompression allows client to opt-out of response compression
  /// for all requests to the server. This is useful to speed up requests
  /// (specifically lists) when client-server network bandwidth is ample,
  /// by saving time on compression (server-side) and decompression
  /// (client-side): https://github.com/kubernetes/kubernetes/issues/112296.
  @JsonKey(name: 'disable-compression')
  final bool? disableCompression;

  /// InsecureSkipTLSVerify skips the validity check for the server's
  /// certificate. This will make your HTTPS connections insecure.
  @JsonKey(name: 'insecure-skip-tls-verify')
  final bool? insecureSkipTlsVerify;

  /// ProxyURL is the URL to the proxy to be used for all requests made by this
  /// client. URLs with "http", "https", and "socks5" schemes are supported.  If
  /// this configuration is not provided or the empty string, the client
  /// attempts to construct a proxy configuration from http_proxy and
  /// https_proxy environment variables. If these environment variables are not
  /// set, the client does not attempt to proxy requests.
  ///
  /// socks5 proxying does not currently support spdy streaming endpoints (exec,
  /// attach, port forward).
  @JsonKey(name: 'proxy-url')
  final String? proxyURL;

  /// Server is the address of the kubernetes cluster (https://hostname:port).
  @JsonKey(name: 'server')
  final String? server;

  /// TLSServerName is used to check server certificate. If TLSServerName is
  /// empty, the hostname used to contact the server is used.
  @JsonKey(name: 'tls-server-name')
  final String? tlsServerName;

  @override
  List<Object?> get props => [
        certificateAuthority,
        certificateAuthorityData,
        disableCompression,
        insecureSkipTlsVerify,
        proxyURL,
        server,
        tlsServerName,
      ];

  @override
  bool get stringify => true;
}
