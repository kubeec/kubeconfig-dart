// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_context.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$NamedContextCWProxy {
  NamedContext name(String? name);

  NamedContext context(Context? context);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NamedContext(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NamedContext(...).copyWith(id: 12, name: "My name")
  /// ````
  NamedContext call({
    String? name,
    Context? context,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfNamedContext.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfNamedContext.copyWith.fieldName(...)`
class _$NamedContextCWProxyImpl implements _$NamedContextCWProxy {
  const _$NamedContextCWProxyImpl(this._value);

  final NamedContext _value;

  @override
  NamedContext name(String? name) => this(name: name);

  @override
  NamedContext context(Context? context) => this(context: context);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `NamedContext(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// NamedContext(...).copyWith(id: 12, name: "My name")
  /// ````
  NamedContext call({
    Object? name = const $CopyWithPlaceholder(),
    Object? context = const $CopyWithPlaceholder(),
  }) {
    return NamedContext(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      context: context == const $CopyWithPlaceholder()
          ? _value.context
          // ignore: cast_nullable_to_non_nullable
          : context as Context?,
    );
  }
}

extension $NamedContextCopyWith on NamedContext {
  /// Returns a callable class that can be used as follows: `instanceOfNamedContext.copyWith(...)` or like so:`instanceOfNamedContext.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$NamedContextCWProxy get copyWith => _$NamedContextCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamedContext _$NamedContextFromJson(Map<String, dynamic> json) => NamedContext(
      name: json['name'] as String?,
      context: json['context'] == null
          ? null
          : Context.fromJson(json['context'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NamedContextToJson(NamedContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('context', instance.context);
  return val;
}
