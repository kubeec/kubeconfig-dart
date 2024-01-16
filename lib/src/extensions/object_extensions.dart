/// Json convert extensions
extension JsonConvertX on Map<String, dynamic> {
  /// Converts JSON to YAML.
  String toYaml() => _condense(
        _formatObject(
          value: this,
          context: const _Context(
            nesting: 0,
          ),
        ),
      );
}

String _formatObject({required dynamic value, required _Context context}) {
  if (value is Map) {
    return _formatStructure(
      structure: value as Map<String, dynamic>,
      context: context,
    );
  } else if (value is Iterable) {
    return _formatCollection(collection: value, context: context);
  } else if (value is String) {
    return _isMultilineString(value)
        ? _formatMultilineString(value, context)
        : _formatSingleLineString(value, context);
  } else if (value == null) {
    return '';
  } else {
    return '$value';
  }
}

String _formatStructure({
  required Map<String, dynamic> structure,
  required _Context context,
}) {
  if (structure.isEmpty) return '{}';

  String separator_(MapEntry<String, dynamic> e) {
    return e.value is Map && (e.value as Map).isNotEmpty
        ? '\n${_indentation(context.nest())}'
        : ' ';
  }

  final entries = structure.entries;
  final firstElement = entries.first;
  final first = '${firstElement.key}:${separator_(firstElement)}'
      '${_formatObject(value: firstElement.value, context: context.nest())}\n';
  final rest = entries
      .skip(1)
      .map(
        (e) => '${_indentation(context)}${e.key}:${separator_(e)}'
            '${_formatObject(value: e.value, context: context.nest())}',
      )
      .join('\n');

  return '$first$rest';
}

String _formatCollection({
  required Iterable<dynamic> collection,
  required _Context context,
}) {
  if (collection.isEmpty) return '';

  return '\n${collection.map(
        (dynamic e) => '${_indentation(context)}- '
            '${_formatObject(
          value: e,
          context: context.nest(),
        )}',
      ).join('\n')}\n';
}

String _condense(String yaml) => _endWithEol(
      yaml
          .split('\n')
          .map((s) => s.trimRight())
          .where((s) => s.isNotEmpty)
          .join('\n'),
    );

String _endWithEol(String s) => '$s\n';

class _Context {
  const _Context({
    required this.nesting,
  });

  final int nesting;

  _Context nest() => _Context(nesting: nesting + 1);
}

const _spacesPerNestingLevel = 2;
String _indentation(_Context ctx) => ''.padLeft(
      ctx.nesting * _spacesPerNestingLevel,
    );

bool _isMultilineString(String value) => value.trim().contains('\n');

String _formatMultilineString(String value, _Context ctx) =>
    '|${_chompModifier(value)}\n'
    '${_indentMultilineString(value, _indentation(ctx))}';

String _chompModifier(String value) => value.endsWith('\n') ? '' : '-';

String _indentMultilineString(String value, String indentation) =>
    value.split('\n').map((s) => '$indentation$s').join('\n');

String _formatSingleLineString(String value, _Context ctx) =>
    _requiresQuotes(value) ? '"$value"' : value;

bool _requiresQuotes(String s) =>
    _isNumeric(s) || _isBoolean(s) || _containsSpecialCharacters(s);

bool _isNumeric(String s) => s.isNotEmpty && num.tryParse(s) != null;

bool _isBoolean(String s) => _booleanValues.contains(s);

bool _containsSpecialCharacters(String s) =>
    _specialCharacters.any((c) => s.contains(c));

const _specialCharacters = {
  ': ', // Indicates mapping in YAML
  '[',
  ']',
  '{',
  '}',
  '>',
  '!',
  '*',
  '&',
  '|',
  '%',
  ' #', // Indicates comment in YAML
  '`',
  '@',
  ',',
  '?',
};

const _booleanValues = {
  '${true}',
  '${false}',
};
