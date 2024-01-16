/// {@template interactive_mode}
/// ExecInteractiveMode is a string that describes an exec plugin's
/// relationship with standard input.
/// {@endtemplate}
enum InteractiveMode {
  /// AlwaysExecInteractiveMode declares that this exec plugin requires
  /// standard input in order to run, and therefore the exec plugin will only
  /// be run if standard input is available for user input. If standard input
  /// is not available for user input, then the exec plugin will not be run and
  /// an error will be returned by the exec plugin runner.
  Always,

  /// IfAvailableExecInteractiveMode declares that this exec plugin would like
  /// to use standard input if it is available, but can still operate if
  /// standard input is not available. Therefore, the exec plugin will be run
  /// regardless of whether stdin is available for user input. If standard input
  /// is available for user input, then it will be provided to this exec plugin.
  IfAvailable,

  /// NeverExecInteractiveMode declares that this exec plugin never needs to
  /// use standard input, and therefore the exec plugin  will be run regardless
  /// of whether standard input is available for user input.
  Never,
}

// ignore_for_file: constant_identifier_names
