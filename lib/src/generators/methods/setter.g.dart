// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.setter;

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

class _$Setter extends Setter {
  @override
  final String name;
  @override
  final String setterType;
  @override
  final String setterValueName;

  factory _$Setter([void updates(SetterBuilder b)]) =>
      (new SetterBuilder()..update(updates)).build();

  _$Setter._({this.name, this.setterType, this.setterValueName}) : super._() {
    if (name == null) throw new BuiltValueNullFieldError('Setter', 'name');
    if (setterType == null)
      throw new BuiltValueNullFieldError('Setter', 'setterType');
    if (setterValueName == null)
      throw new BuiltValueNullFieldError('Setter', 'setterValueName');
  }

  @override
  Setter rebuild(void updates(SetterBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SetterBuilder toBuilder() => new SetterBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! Setter) return false;
    return name == other.name &&
        setterType == other.setterType &&
        setterValueName == other.setterValueName;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), setterType.hashCode),
        setterValueName.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Setter')
          ..add('name', name)
          ..add('setterType', setterType)
          ..add('setterValueName', setterValueName))
        .toString();
  }
}

class SetterBuilder implements Builder<Setter, SetterBuilder> {
  _$Setter _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _setterType;
  String get setterType => _$this._setterType;
  set setterType(String setterType) => _$this._setterType = setterType;

  String _setterValueName;
  String get setterValueName => _$this._setterValueName;
  set setterValueName(String setterValueName) =>
      _$this._setterValueName = setterValueName;

  SetterBuilder();

  SetterBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _setterType = _$v.setterType;
      _setterValueName = _$v.setterValueName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Setter other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$Setter;
  }

  @override
  void update(void updates(SetterBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Setter build() {
    final _$result = _$v ??
        new _$Setter._(
            name: name,
            setterType: setterType,
            setterValueName: setterValueName);
    replace(_$result);
    return _$result;
  }
}
