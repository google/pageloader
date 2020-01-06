// GENERATED CODE - DO NOT MODIFY BY HAND

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
    if (name == null) {
      throw new BuiltValueNullFieldError('Getter', 'name');
    }
    if (returnType == null) {
      throw new BuiltValueNullFieldError('Getter', 'returnType');
    }
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
    if (_$v != null) {
      _name = _$v.name;
      _returnType = _$v.returnType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Getter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Getter;
  }

  @override
  void update(void Function(GetterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Getter build() {
    final _$result = _$v ?? new _$Getter._(name: name, returnType: returnType);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
