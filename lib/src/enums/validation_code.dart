/// {@template validation_code}
/// Kubeconfig validation code.
/// {@endtemplate}
enum ValidationCode {
  /// Kubeconfig is valid
  valid,

  /// "clusters" was not found
  clustersRequired,

  /// "contexts" was not found
  contextsRequired,

  /// "users" was not found
  usersRequired,

  /// "name" is required for a named cluster
  nameRequiredForNamedCluster,

  /// "name" is required for a named context
  nameRequiredForNamedContext,

  /// "name" is required for a named user
  nameRequiredForNamedUser,

  /// "cluster" is required for a named cluster
  clusterRequiredForNamedCluster,

  /// "context" is required for a named context
  contextRequiredForNamedContext,

  /// "user" is required for a named user
  userRequiredForNamedUser,

  /// "server" is required for a cluster
  serverRequiredForCluster,

  /// "cluster" is required for a context
  clusterRequiredForContext,

  /// "user" is required for a context
  userRequiredForContext,

  /// No more than one cluster with the same name
  namedClusterDuplicate,

  /// No more than one context with the same name
  namedContextDuplicate,

  /// No more than one user with the same name
  namedUserDuplicate,

  /// Current context was not found
  currentContextNotFound,

  /// cluster "x" was not found for context "y"
  clusterNotFoundForContext,

  /// user "x" was not found for context "y"
  userNotFoundForContext,

  /// namespace "x" for context "y" max length cannot be greater than 63
  namespaceInvalidMaxLengthForContext,

  /// namespace "x" for context "y" must be lower case alphanumeric characters
  /// with dash
  namespaceFormatNotMatchForContext,

  /// certificate-authority-data and certificate-authority are both specified
  /// for "x"
  certificateAuthorityErrorForCluster,

  /// Unable to read certificate-authority "x" for "y"
  certificateAuthorityFileErrorForCluster,

  /// Invalid proxy-url for "x"
  proxyUrlInvalidForCluster,

  /// Unsupported proxy-url scheme "x", must be http, https, or socks5 for "y"
  proxyUrlInvalidSchemeForCluster,

  /// client-cert-data and client-cert are both specified for "x"
  clientCertErrorForUser,

  /// client-key-data and client-key are both specified for "x"
  clientKeyErrorForUser,

  /// client-key-data or client-key must be specified for "x" to use the
  /// clientCert auth method
  clientKeyNotFoundForUser,

  /// Unable to read client-cert "x" for "y"
  clientCertFileErrorForUser,

  /// Unable to read client-key "x" for "y"
  clientKeyFileErrorForUser,

  /// authProvider cannot be provided in combination with an exec plugin for "x"
  authProviderAndExecErrorForUser,

  /// command must be specified for "x" to use exec authentication plugin
  execCommandNotFoundForUser,

  /// apiVersion must be specified for "x" to use exec authentication plugin
  execApiVersionNotFoundForUser,

  /// env variable name must be specified for "x" to use exec authentication
  /// plugin
  execEnvNameNotFoundForUser,

  /// More than one authentication method found for "x"; found
  /// (token, basicAuth), only one is allowed
  moreThanOneAuthFoundForUser,

  /// Requesting uid, groups or user-extra for "x" without impersonating a user
  impersonatingErrorForUser,
}
