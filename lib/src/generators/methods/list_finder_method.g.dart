// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.list_finder_method;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ListFinderMethod extends ListFinderMethod {
  @override
  final String name;
  @override
  final String listTypeArgument;
  @override
  final String finderDeclaration;
  @override
  final String filterDeclarations;
  @override
  final String checkerDeclarations;
  @override
  final bool isFuture;
  @override
  final Optional<String> genericType;

  factory _$ListFinderMethod(
          [void Function(ListFinderMethodBuilder) updates]) =>
      (new ListFinderMethodBuilder()..update(updates)).build();

  _$ListFinderMethod._(
      {this.name,
      this.listTypeArgument,
      this.finderDeclaration,
      this.filterDeclarations,
      this.checkerDeclarations,
      this.isFuture,
      this.genericType})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('ListFinderMethod', 'name');
    }
    if (listTypeArgument == null) {
      throw new BuiltValueNullFieldError(
          'ListFinderMethod', 'listTypeArgument');
    }
    if (finderDeclaration == null) {
      throw new BuiltValueNullFieldError(
          'ListFinderMethod', 'finderDeclaration');
    }
    if (filterDeclarations == null) {
      throw new BuiltValueNullFieldError(
          'ListFinderMethod', 'filterDeclarations');
    }
    if (checkerDeclarations == null) {
      throw new BuiltValueNullFieldError(
          'ListFinderMethod', 'checkerDeclarations');
    }
    if (isFuture == null) {
      throw new BuiltValueNullFieldError('ListFinderMethod', 'isFuture');
    }
    if (genericType == null) {
      throw new BuiltValueNullFieldError('ListFinderMethod', 'genericType');
    }
  }

  @override
  ListFinderMethod rebuild(void Function(ListFinderMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListFinderMethodBuilder toBuilder() =>
      new ListFinderMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListFinderMethod &&
        name == other.name &&
        listTypeArgument == other.listTypeArgument &&
        finderDeclaration == other.finderDeclaration &&
        filterDeclarations == other.filterDeclarations &&
        checkerDeclarations == other.checkerDeclarations &&
        isFuture == other.isFuture &&
        genericType == other.genericType;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, name.hashCode), listTypeArgument.hashCode),
                        finderDeclaration.hashCode),
                    filterDeclarations.hashCode),
                checkerDeclarations.hashCode),
            isFuture.hashCode),
        genericType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ListFinderMethod')
          ..add('name', name)
          ..add('listTypeArgument', listTypeArgument)
          ..add('finderDeclaration', finderDeclaration)
          ..add('filterDeclarations', filterDeclarations)
          ..add('checkerDeclarations', checkerDeclarations)
          ..add('isFuture', isFuture)
          ..add('genericType', genericType))
        .toString();
  }
}

class ListFinderMethodBuilder
    implements
        Builder<ListFinderMethod, ListFinderMethodBuilder>,
        ListFinderMethodBaseBuilder {
  _$ListFinderMethod _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _listTypeArgument;
  String get listTypeArgument => _$this._listTypeArgument;
  set listTypeArgument(String listTypeArgument) =>
      _$this._listTypeArgument = listTypeArgument;

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

  bool _isFuture;
  bool get isFuture => _$this._isFuture;
  set isFuture(bool isFuture) => _$this._isFuture = isFuture;

  Optional<String> _genericType;
  Optional<String> get genericType => _$this._genericType;
  set genericType(Optional<String> genericType) =>
      _$this._genericType = genericType;

  ListFinderMethodBuilder();

  ListFinderMethodBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _listTypeArgument = _$v.listTypeArgument;
      _finderDeclaration = _$v.finderDeclaration;
      _filterDeclarations = _$v.filterDeclarations;
      _checkerDeclarations = _$v.checkerDeclarations;
      _isFuture = _$v.isFuture;
      _genericType = _$v.genericType;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ListFinderMethod other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ListFinderMethod;
  }

  @override
  void update(void Function(ListFinderMethodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ListFinderMethod build() {
    final _$result = _$v ??
        new _$ListFinderMethod._(
            name: name,
            listTypeArgument: listTypeArgument,
            finderDeclaration: finderDeclaration,
            filterDeclarations: filterDeclarations,
            checkerDeclarations: checkerDeclarations,
            isFuture: isFuture,
            genericType: genericType);
    replace(_$result);
    return _$result;
  }
}

abstract class ListFinderMethodBaseBuilder {
  void replace(ListFinderMethodBase other);
  void update(void Function(ListFinderMethodBaseBuilder) updates);
  String get name;
  set name(String name);

  String get listTypeArgument;
  set listTypeArgument(String listTypeArgument);

  String get finderDeclaration;
  set finderDeclaration(String finderDeclaration);

  String get filterDeclarations;
  set filterDeclarations(String filterDeclarations);

  String get checkerDeclarations;
  set checkerDeclarations(String checkerDeclarations);

  bool get isFuture;
  set isFuture(bool isFuture);

  Optional<String> get genericType;
  set genericType(Optional<String> genericType);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
