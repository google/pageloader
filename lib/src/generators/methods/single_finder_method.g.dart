// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.single_finder_method;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SingleFinderMethod extends SingleFinderMethod {
  @override
  final String name;
  @override
  final String pageObjectType;
  @override
  final Optional<String> finderDeclaration;
  @override
  final String filterDeclarations;
  @override
  final String checkerDeclarations;
  @override
  final Optional<String> templateType;
  @override
  final bool isRoot;
  @override
  final bool isNullElement;

  factory _$SingleFinderMethod(
          [void Function(SingleFinderMethodBuilder) updates]) =>
      (new SingleFinderMethodBuilder()..update(updates)).build();

  _$SingleFinderMethod._(
      {this.name,
      this.pageObjectType,
      this.finderDeclaration,
      this.filterDeclarations,
      this.checkerDeclarations,
      this.templateType,
      this.isRoot,
      this.isNullElement})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('SingleFinderMethod', 'name');
    }
    if (pageObjectType == null) {
      throw new BuiltValueNullFieldError(
          'SingleFinderMethod', 'pageObjectType');
    }
    if (finderDeclaration == null) {
      throw new BuiltValueNullFieldError(
          'SingleFinderMethod', 'finderDeclaration');
    }
    if (filterDeclarations == null) {
      throw new BuiltValueNullFieldError(
          'SingleFinderMethod', 'filterDeclarations');
    }
    if (checkerDeclarations == null) {
      throw new BuiltValueNullFieldError(
          'SingleFinderMethod', 'checkerDeclarations');
    }
    if (templateType == null) {
      throw new BuiltValueNullFieldError('SingleFinderMethod', 'templateType');
    }
    if (isRoot == null) {
      throw new BuiltValueNullFieldError('SingleFinderMethod', 'isRoot');
    }
    if (isNullElement == null) {
      throw new BuiltValueNullFieldError('SingleFinderMethod', 'isNullElement');
    }
  }

  @override
  SingleFinderMethod rebuild(
          void Function(SingleFinderMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleFinderMethodBuilder toBuilder() =>
      new SingleFinderMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleFinderMethod &&
        name == other.name &&
        pageObjectType == other.pageObjectType &&
        finderDeclaration == other.finderDeclaration &&
        filterDeclarations == other.filterDeclarations &&
        checkerDeclarations == other.checkerDeclarations &&
        templateType == other.templateType &&
        isRoot == other.isRoot &&
        isNullElement == other.isNullElement;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), pageObjectType.hashCode),
                            finderDeclaration.hashCode),
                        filterDeclarations.hashCode),
                    checkerDeclarations.hashCode),
                templateType.hashCode),
            isRoot.hashCode),
        isNullElement.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SingleFinderMethod')
          ..add('name', name)
          ..add('pageObjectType', pageObjectType)
          ..add('finderDeclaration', finderDeclaration)
          ..add('filterDeclarations', filterDeclarations)
          ..add('checkerDeclarations', checkerDeclarations)
          ..add('templateType', templateType)
          ..add('isRoot', isRoot)
          ..add('isNullElement', isNullElement))
        .toString();
  }
}

class SingleFinderMethodBuilder
    implements
        Builder<SingleFinderMethod, SingleFinderMethodBuilder>,
        SingleFinderMethodBaseBuilder {
  _$SingleFinderMethod _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _pageObjectType;
  String get pageObjectType => _$this._pageObjectType;
  set pageObjectType(String pageObjectType) =>
      _$this._pageObjectType = pageObjectType;

  Optional<String> _finderDeclaration;
  Optional<String> get finderDeclaration => _$this._finderDeclaration;
  set finderDeclaration(Optional<String> finderDeclaration) =>
      _$this._finderDeclaration = finderDeclaration;

  String _filterDeclarations;
  String get filterDeclarations => _$this._filterDeclarations;
  set filterDeclarations(String filterDeclarations) =>
      _$this._filterDeclarations = filterDeclarations;

  String _checkerDeclarations;
  String get checkerDeclarations => _$this._checkerDeclarations;
  set checkerDeclarations(String checkerDeclarations) =>
      _$this._checkerDeclarations = checkerDeclarations;

  Optional<String> _templateType;
  Optional<String> get templateType => _$this._templateType;
  set templateType(Optional<String> templateType) =>
      _$this._templateType = templateType;

  bool _isRoot;
  bool get isRoot => _$this._isRoot;
  set isRoot(bool isRoot) => _$this._isRoot = isRoot;

  bool _isNullElement;
  bool get isNullElement => _$this._isNullElement;
  set isNullElement(bool isNullElement) =>
      _$this._isNullElement = isNullElement;

  SingleFinderMethodBuilder();

  SingleFinderMethodBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _pageObjectType = _$v.pageObjectType;
      _finderDeclaration = _$v.finderDeclaration;
      _filterDeclarations = _$v.filterDeclarations;
      _checkerDeclarations = _$v.checkerDeclarations;
      _templateType = _$v.templateType;
      _isRoot = _$v.isRoot;
      _isNullElement = _$v.isNullElement;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SingleFinderMethod other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SingleFinderMethod;
  }

  @override
  void update(void Function(SingleFinderMethodBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SingleFinderMethod build() {
    final _$result = _$v ??
        new _$SingleFinderMethod._(
            name: name,
            pageObjectType: pageObjectType,
            finderDeclaration: finderDeclaration,
            filterDeclarations: filterDeclarations,
            checkerDeclarations: checkerDeclarations,
            templateType: templateType,
            isRoot: isRoot,
            isNullElement: isNullElement);
    replace(_$result);
    return _$result;
  }
}

abstract class SingleFinderMethodBaseBuilder {
  void replace(SingleFinderMethodBase other);
  void update(void Function(SingleFinderMethodBaseBuilder) updates);
  String get name;
  set name(String name);

  String get pageObjectType;
  set pageObjectType(String pageObjectType);

  Optional<String> get finderDeclaration;
  set finderDeclaration(Optional<String> finderDeclaration);

  String get filterDeclarations;
  set filterDeclarations(String filterDeclarations);

  String get checkerDeclarations;
  set checkerDeclarations(String checkerDeclarations);

  Optional<String> get templateType;
  set templateType(Optional<String> templateType);

  bool get isRoot;
  set isRoot(bool isRoot);

  bool get isNullElement;
  set isNullElement(bool isNullElement);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
