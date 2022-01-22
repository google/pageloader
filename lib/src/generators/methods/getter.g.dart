// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.9

part of pageloader.getter;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Getter extends Getter {
  @override
  final String name;
  @override
  final String returnType;

  factory _$Getter([void Function(GetterBuilder) updates]) =>
      (new GetterBuilder()..update(updates)).build();

  _$Getter._({this.name, this.returnType}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'Getter', 'name');
    BuiltValueNullFieldError.checkNotNull(returnType, 'Getter', 'returnType');
  }

  @override
  Getter rebuild(void Function(GetterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetterBuilder toBuilder() => new GetterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Getter &&
        name == other.name &&
        returnType == other.returnType;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), returnType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Getter')
          ..add('name', name)
          ..add('returnType', returnType))
        .toString();
  }
}

class GetterBuilder implements Builder<Getter, GetterBuilder> {
  _$Getter _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _returnType;
  String get returnType => _$this._returnType;
  set returnType(String returnType) => _$this._returnType = returnType;

  GetterBuilder();

  GetterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _returnType = $v.returnType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Getter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Getter;
  }

  @override
  void update(void Function(GetterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Getter build() {
    final _$result = _$v ??
        new _$Getter._(
            name: BuiltValueNullFieldError.checkNotNull(name, 'Getter', 'name'),
            returnType: BuiltValueNullFieldError.checkNotNull(
                returnType, 'Getter', 'returnType'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
