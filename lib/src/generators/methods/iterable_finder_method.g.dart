// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.iterable_finder_method;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$IterableFinderMethod extends IterableFinderMethod {
  @override
  final String name;
  @override
  final String iterableTypeArgument;
  @override
  final String finderDeclaration;
  @override
  final String filterDeclarations;
  @override
  final String checkerDeclarations;

  factory _$IterableFinderMethod(
          [void Function(IterableFinderMethodBuilder) updates]) =>
      (new IterableFinderMethodBuilder()..update(updates)).build();

  _$IterableFinderMethod._(
      {this.name,
      this.iterableTypeArgument,
      this.finderDeclaration,
      this.filterDeclarations,
      this.checkerDeclarations})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('IterableFinderMethod', 'name');
    }
    if (iterableTypeArgument == null) {
      throw new BuiltValueNullFieldError(
          'IterableFinderMethod', 'iterableTypeArgument');
    }
    if (finderDeclaration == null) {
      throw new BuiltValueNullFieldError(
          'IterableFinderMethod', 'finderDeclaration');
    }
    if (filterDeclarations == null) {
      throw new BuiltValueNullFieldError(
          'IterableFinderMethod', 'filterDeclarations');
    }
    if (checkerDeclarations == null) {
      throw new BuiltValueNullFieldError(
          'IterableFinderMethod', 'checkerDeclarations');
    }
  }

  @override
  IterableFinderMethod rebuild(
          void Function(IterableFinderMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  IterableFinderMethodBuilder toBuilder() =>
      new IterableFinderMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is IterableFinderMethod &&
        name == other.name &&
        iterableTypeArgument == other.iterableTypeArgument &&
        finderDeclaration == other.finderDeclaration &&
        filterDeclarations == other.filterDeclarations &&
        checkerDeclarations == other.checkerDeclarations;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, name.hashCode), iterableTypeArgument.hashCode),
                finderDeclaration.hashCode),
            filterDeclarations.hashCode),
        checkerDeclarations.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('IterableFinderMethod')
          ..add('name', name)
          ..add('iterableTypeArgument', iterableTypeArgument)
          ..add('finderDeclaration', finderDeclaration)
          ..add('filterDeclarations', filterDeclarations)
          ..add('checkerDeclarations', checkerDeclarations))
        .toString();
  }
}

class IterableFinderMethodBuilder
    implements Builder<IterableFinderMethod, IterableFinderMethodBuilder> {
  _$IterableFinderMethod _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _iterableTypeArgument;
  String get iterableTypeArgument => _$this._iterableTypeArgument;
  set iterableTypeArgument(String iterableTypeArgument) =>
      _$this._iterableTypeArgument = iterableTypeArgument;

  String _finderDeclaration;
  String get finderDeclaration => _$this._finderDeclaration;
  set finderDeclaration(String finderDeclaration) =>
      _$this._finderDeclaration = finderDeclaration;

  String _filterDeclarations;
  String get filterDeclarations => _$this._filterDeclarations;
  set filterDeclarations(String filterDeclarations) =>
      _$this._filterDeclarations = filterDeclarations;

  String _checkerDeclarations;
  String get checkerDeclarations => _$this._checkerDeclarations;
  set checkerDeclarations(String checkerDeclarations) =>
      _$this._checkerDeclarations = checkerDeclarations;

  IterableFinderMethodBuilder();

  IterableFinderMethodBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _iterableTypeArgument = _$v.iterableTypeArgument;
      _finderDeclaration = _$v.finderDeclaration;
      _filterDeclarations = _$v.filterDeclarations;
      _checkerDeclarations = _$v.checkerDeclarations;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IterableFinderMethod other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$IterableFinderMethod;
  }

  @override
  void update(void Function(IterableFinderMethodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IterableFinderMethod build() {
    final _$result = _$v ??
        new _$IterableFinderMethod._(
            name: name,
            iterableTypeArgument: iterableTypeArgument,
            finderDeclaration: finderDeclaration,
            filterDeclarations: filterDeclarations,
            checkerDeclarations: checkerDeclarations);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
