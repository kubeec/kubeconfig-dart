import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'preferences.g.dart';

/// {@template preferences}
/// Preferences holds general information to be use for cli interactions.
/// {@endtemplate}
@CopyWith()
@JsonSerializable(includeIfNull: false)
@immutable
class Preferences extends Equatable {
  /// {@macro preferences}
  const Preferences({
    required this.colors,
  });

  /// Creates a new instance from json.
  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);

  /// Converts to json.
  Map<String, dynamic> toJson() => _$PreferencesToJson(this);

  /// Enable colors.
  @JsonKey(name: 'colors')
  final bool? colors;

  @override
  List<Object?> get props => [
        colors,
      ];

  @override
  bool get stringify => true;
}
