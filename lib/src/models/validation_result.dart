import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kubeconfig/src/enums/validation_code.dart';
import 'package:meta/meta.dart';

part 'validation_result.g.dart';

/// {@template validation_result}
/// Kubeconfig validation result.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class ValidationResult extends Equatable {
  /// {@macro validation_result}
  const ValidationResult({
    required this.code,
    this.description,
  });

  /// Creates a new instance from json.
  factory ValidationResult.fromJson(Map<String, dynamic> json) =>
      _$ValidationResultFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$ValidationResultToJson(this);

  /// Validation code.
  @JsonKey(name: 'code')
  final ValidationCode code;

  /// Validation description.
  @JsonKey(name: 'description')
  final String? description;

  @override
  List<Object?> get props => [
        code,
        description,
      ];

  @override
  bool get stringify => true;
}
