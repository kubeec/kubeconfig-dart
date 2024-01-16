// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PreferencesCWProxy {
  Preferences colors(bool? colors);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Preferences(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Preferences(...).copyWith(id: 12, name: "My name")
  /// ````
  Preferences call({
    bool? colors,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPreferences.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPreferences.copyWith.fieldName(...)`
class _$PreferencesCWProxyImpl implements _$PreferencesCWProxy {
  const _$PreferencesCWProxyImpl(this._value);

  final Preferences _value;

  @override
  Preferences colors(bool? colors) => this(colors: colors);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Preferences(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Preferences(...).copyWith(id: 12, name: "My name")
  /// ````
  Preferences call({
    Object? colors = const $CopyWithPlaceholder(),
  }) {
    return Preferences(
      colors: colors == const $CopyWithPlaceholder()
          ? _value.colors
          // ignore: cast_nullable_to_non_nullable
          : colors as bool?,
    );
  }
}

extension $PreferencesCopyWith on Preferences {
  /// Returns a callable class that can be used as follows: `instanceOfPreferences.copyWith(...)` or like so:`instanceOfPreferences.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PreferencesCWProxy get copyWith => _$PreferencesCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      colors: json['colors'] as bool?,
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('colors', instance.colors);
  return val;
}
