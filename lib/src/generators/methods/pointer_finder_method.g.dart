// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.pointer_finder_method;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PointerFinderMethod extends PointerFinderMethod {
  @override
  final NullSafety nullSafety;
  @override
  final String name;

  factory _$PointerFinderMethod(
          [void Function(PointerFinderMethodBuilder)? updates]) =>
      (new PointerFinderMethodBuilder()..update(updates)).build();

  _$PointerFinderMethod._({required this.nullSafety, required this.name})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nullSafety, 'PointerFinderMethod', 'nullSafety');
    BuiltValueNullFieldError.checkNotNull(name, 'PointerFinderMethod', 'name');
  }

  @override
  PointerFinderMethod rebuild(
          void Function(PointerFinderMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PointerFinderMethodBuilder toBuilder() =>
      new PointerFinderMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PointerFinderMethod &&
        nullSafety == other.nullSafety &&
        name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nullSafety.hashCode), name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PointerFinderMethod')
          ..add('nullSafety', nullSafety)
          ..add('name', name))
        .toString();
  }
}

class PointerFinderMethodBuilder
    implements Builder<PointerFinderMethod, PointerFinderMethodBuilder> {
  _$PointerFinderMethod? _$v;

  NullSafetyBuilder? _nullSafety;
  NullSafetyBuilder get nullSafety =>
      _$this._nullSafety ??= new NullSafetyBuilder();
  set nullSafety(NullSafetyBuilder? nullSafety) =>
      _$this._nullSafety = nullSafety;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  PointerFinderMethodBuilder();

  PointerFinderMethodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nullSafety = $v.nullSafety.toBuilder();
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PointerFinderMethod other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PointerFinderMethod;
  }

  @override
  void update(void Function(PointerFinderMethodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PointerFinderMethod build() {
    _$PointerFinderMethod _$result;
    try {
      _$result = _$v ??
          new _$PointerFinderMethod._(
              nullSafety: nullSafety.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, 'PointerFinderMethod', 'name'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'nullSafety';
        nullSafety.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PointerFinderMethod', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
