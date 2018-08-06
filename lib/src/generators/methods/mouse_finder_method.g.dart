// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.mouse_finder_method;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$MouseFinderMethod extends MouseFinderMethod {
  @override
  final String name;

  factory _$MouseFinderMethod([void updates(MouseFinderMethodBuilder b)]) =>
      (new MouseFinderMethodBuilder()..update(updates)).build();

  _$MouseFinderMethod._({this.name}) : super._() {
    if (name == null)
      throw new BuiltValueNullFieldError('MouseFinderMethod', 'name');
  }

  @override
  MouseFinderMethod rebuild(void updates(MouseFinderMethodBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MouseFinderMethodBuilder toBuilder() =>
      new MouseFinderMethodBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! MouseFinderMethod) return false;
    return name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MouseFinderMethod')..add('name', name))
        .toString();
  }
}

class MouseFinderMethodBuilder
    implements Builder<MouseFinderMethod, MouseFinderMethodBuilder> {
  _$MouseFinderMethod _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  MouseFinderMethodBuilder();

  MouseFinderMethodBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MouseFinderMethod other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$MouseFinderMethod;
  }

  @override
  void update(void updates(MouseFinderMethodBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MouseFinderMethod build() {
    final _$result = _$v ?? new _$MouseFinderMethod._(name: name);
    replace(_$result);
    return _$result;
  }
}
