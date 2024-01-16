import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kubeconfig/src/models/context.dart';
import 'package:meta/meta.dart';

part 'named_context.g.dart';

/// {@template named_context}
/// NamedContext relates nicknames to context information.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class NamedContext extends Equatable {
  /// {@macro named_context}
  const NamedContext({
    required this.name,
    required this.context,
  });

  /// Creates a new instance from json.
  factory NamedContext.fromJson(Map<String, dynamic> json) =>
      _$NamedContextFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$NamedContextToJson(this);

  /// Name is the nickname for this Context
  @JsonKey(name: 'name')
  final String? name;

  /// Context holds the context information
  @JsonKey(name: 'context')
  final Context? context;

  @override
  List<Object?> get props => [
        name,
        context,
      ];

  @override
  bool get stringify => true;
}
