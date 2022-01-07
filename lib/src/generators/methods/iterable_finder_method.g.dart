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
          [void Function(IterableFinderMethodBuilder)? updates]) =>
      (new IterableFinderMethodBuilder()..update(updates)).build();

  _$IterableFinderMethod._(
      {required this.name,
      required this.iterableTypeArgument,
      required this.finderDeclaration,
      required this.filterDeclarations,
      required this.checkerDeclarations})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'IterableFinderMethod', 'name');
    BuiltValueNullFieldError.checkNotNull(
        iterableTypeArgument, 'IterableFinderMethod', 'iterableTypeArgument');
    BuiltValueNullFieldError.checkNotNull(
        finderDeclaration, 'IterableFinderMethod', 'finderDeclaration');
    BuiltValueNullFieldError.checkNotNull(
        filterDeclarations, 'IterableFinderMethod', 'filterDeclarations');
    BuiltValueNullFieldError.checkNotNull(
        checkerDeclarations, 'IterableFinderMethod', 'checkerDeclarations');
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
  _$IterableFinderMethod? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _iterableTypeArgument;
  String? get iterableTypeArgument => _$this._iterableTypeArgument;
  set iterableTypeArgument(String? iterableTypeArgument) =>
      _$this._iterableTypeArgument = iterableTypeArgument;

  String? _finderDeclaration;
  String? get finderDeclaration => _$this._finderDeclaration;
  set finderDeclaration(String? finderDeclaration) =>
      _$this._finderDeclaration = finderDeclaration;

  String? _filterDeclarations;
  String? get filterDeclarations => _$this._filterDeclarations;
  set filterDeclarations(String? filterDeclarations) =>
      _$this._filterDeclarations = filterDeclarations;

  String? _checkerDeclarations;
  String? get checkerDeclarations => _$this._checkerDeclarations;
  set checkerDeclarations(String? checkerDeclarations) =>
      _$this._checkerDeclarations = checkerDeclarations;

  IterableFinderMethodBuilder();

  IterableFinderMethodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _iterableTypeArgument = $v.iterableTypeArgument;
      _finderDeclaration = $v.finderDeclaration;
      _filterDeclarations = $v.filterDeclarations;
      _checkerDeclarations = $v.checkerDeclarations;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(IterableFinderMethod other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$IterableFinderMethod;
  }

  @override
  void update(void Function(IterableFinderMethodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$IterableFinderMethod build() {
    final _$result = _$v ??
        new _$IterableFinderMethod._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'IterableFinderMethod', 'name'),
            iterableTypeArgument: BuiltValueNullFieldError.checkNotNull(
                iterableTypeArgument,
                'IterableFinderMethod',
                'iterableTypeArgument'),
            finderDeclaration: BuiltValueNullFieldError.checkNotNull(
                finderDeclaration, 'IterableFinderMethod', 'finderDeclaration'),
            filterDeclarations: BuiltValueNullFieldError.checkNotNull(
                filterDeclarations,
                'IterableFinderMethod',
                'filterDeclarations'),
            checkerDeclarations: BuiltValueNullFieldError.checkNotNull(
                checkerDeclarations,
                'IterableFinderMethod',
                'checkerDeclarations'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
