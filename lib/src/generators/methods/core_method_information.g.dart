// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.core_method_information;

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

class _$TypeInformation extends TypeInformation {
  @override
  final String type;
  @override
  final List<TypeInformation> typeArguments;

  factory _$TypeInformation([void updates(TypeInformationBuilder b)]) =>
      (new TypeInformationBuilder()..update(updates)).build();

  _$TypeInformation._({this.type, this.typeArguments}) : super._() {
    if (type == null)
      throw new BuiltValueNullFieldError('TypeInformation', 'type');
    if (typeArguments == null)
      throw new BuiltValueNullFieldError('TypeInformation', 'typeArguments');
  }

  @override
  TypeInformation rebuild(void updates(TypeInformationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeInformationBuilder toBuilder() =>
      new TypeInformationBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! TypeInformation) return false;
    return type == other.type && typeArguments == other.typeArguments;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, type.hashCode), typeArguments.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TypeInformation')
          ..add('type', type)
          ..add('typeArguments', typeArguments))
        .toString();
  }
}

class TypeInformationBuilder
    implements Builder<TypeInformation, TypeInformationBuilder> {
  _$TypeInformation _$v;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  List<TypeInformation> _typeArguments;
  List<TypeInformation> get typeArguments => _$this._typeArguments;
  set typeArguments(List<TypeInformation> typeArguments) =>
      _$this._typeArguments = typeArguments;

  TypeInformationBuilder();

  TypeInformationBuilder get _$this {
    if (_$v != null) {
      _type = _$v.type;
      _typeArguments = _$v.typeArguments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeInformation other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$TypeInformation;
  }

  @override
  void update(void updates(TypeInformationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeInformation build() {
    final _$result = _$v ??
        new _$TypeInformation._(type: type, typeArguments: typeArguments);
    replace(_$result);
    return _$result;
  }
}

class _$CoreMethodInformation extends CoreMethodInformation {
  @override
  final String name;
  @override
  final bool isGetter;
  @override
  final bool isAbstract;
  @override
  final String pageObjectType;
  @override
  final Optional<String> pageObjectTemplate;
  @override
  final bool isFuture;
  @override
  final bool isList;
  @override
  final bool isMouse;
  @override
  final Optional<String> finder;
  @override
  final List<String> filters;
  @override
  final List<String> checkers;
  @override
  final bool isRoot;
  @override
  final String nodeSource;

  factory _$CoreMethodInformation(
          [void updates(CoreMethodInformationBuilder b)]) =>
      (new CoreMethodInformationBuilder()..update(updates)).build();

  _$CoreMethodInformation._(
      {this.name,
      this.isGetter,
      this.isAbstract,
      this.pageObjectType,
      this.pageObjectTemplate,
      this.isFuture,
      this.isList,
      this.isMouse,
      this.finder,
      this.filters,
      this.checkers,
      this.isRoot,
      this.nodeSource})
      : super._() {
    if (name == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'name');
    if (isGetter == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'isGetter');
    if (isAbstract == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'isAbstract');
    if (pageObjectType == null)
      throw new BuiltValueNullFieldError(
          'CoreMethodInformation', 'pageObjectType');
    if (pageObjectTemplate == null)
      throw new BuiltValueNullFieldError(
          'CoreMethodInformation', 'pageObjectTemplate');
    if (isFuture == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'isFuture');
    if (isList == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'isList');
    if (isMouse == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'isMouse');
    if (finder == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'finder');
    if (filters == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'filters');
    if (checkers == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'checkers');
    if (isRoot == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'isRoot');
    if (nodeSource == null)
      throw new BuiltValueNullFieldError('CoreMethodInformation', 'nodeSource');
  }

  @override
  CoreMethodInformation rebuild(void updates(CoreMethodInformationBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CoreMethodInformationBuilder toBuilder() =>
      new CoreMethodInformationBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! CoreMethodInformation) return false;
    return name == other.name &&
        isGetter == other.isGetter &&
        isAbstract == other.isAbstract &&
        pageObjectType == other.pageObjectType &&
        pageObjectTemplate == other.pageObjectTemplate &&
        isFuture == other.isFuture &&
        isList == other.isList &&
        isMouse == other.isMouse &&
        finder == other.finder &&
        filters == other.filters &&
        checkers == other.checkers &&
        isRoot == other.isRoot &&
        nodeSource == other.nodeSource;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, name.hashCode),
                                                    isGetter.hashCode),
                                                isAbstract.hashCode),
                                            pageObjectType.hashCode),
                                        pageObjectTemplate.hashCode),
                                    isFuture.hashCode),
                                isList.hashCode),
                            isMouse.hashCode),
                        finder.hashCode),
                    filters.hashCode),
                checkers.hashCode),
            isRoot.hashCode),
        nodeSource.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CoreMethodInformation')
          ..add('name', name)
          ..add('isGetter', isGetter)
          ..add('isAbstract', isAbstract)
          ..add('pageObjectType', pageObjectType)
          ..add('pageObjectTemplate', pageObjectTemplate)
          ..add('isFuture', isFuture)
          ..add('isList', isList)
          ..add('isMouse', isMouse)
          ..add('finder', finder)
          ..add('filters', filters)
          ..add('checkers', checkers)
          ..add('isRoot', isRoot)
          ..add('nodeSource', nodeSource))
        .toString();
  }
}

class CoreMethodInformationBuilder
    implements
        Builder<CoreMethodInformation, CoreMethodInformationBuilder>,
        CoreMethodInformationBaseBuilder {
  _$CoreMethodInformation _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  bool _isGetter;
  bool get isGetter => _$this._isGetter;
  set isGetter(bool isGetter) => _$this._isGetter = isGetter;

  bool _isAbstract;
  bool get isAbstract => _$this._isAbstract;
  set isAbstract(bool isAbstract) => _$this._isAbstract = isAbstract;

  String _pageObjectType;
  String get pageObjectType => _$this._pageObjectType;
  set pageObjectType(String pageObjectType) =>
      _$this._pageObjectType = pageObjectType;

  Optional<String> _pageObjectTemplate;
  Optional<String> get pageObjectTemplate => _$this._pageObjectTemplate;
  set pageObjectTemplate(Optional<String> pageObjectTemplate) =>
      _$this._pageObjectTemplate = pageObjectTemplate;

  bool _isFuture;
  bool get isFuture => _$this._isFuture;
  set isFuture(bool isFuture) => _$this._isFuture = isFuture;

  bool _isList;
  bool get isList => _$this._isList;
  set isList(bool isList) => _$this._isList = isList;

  bool _isMouse;
  bool get isMouse => _$this._isMouse;
  set isMouse(bool isMouse) => _$this._isMouse = isMouse;

  Optional<String> _finder;
  Optional<String> get finder => _$this._finder;
  set finder(Optional<String> finder) => _$this._finder = finder;

  List<String> _filters;
  List<String> get filters => _$this._filters;
  set filters(List<String> filters) => _$this._filters = filters;

  List<String> _checkers;
  List<String> get checkers => _$this._checkers;
  set checkers(List<String> checkers) => _$this._checkers = checkers;

  bool _isRoot;
  bool get isRoot => _$this._isRoot;
  set isRoot(bool isRoot) => _$this._isRoot = isRoot;

  String _nodeSource;
  String get nodeSource => _$this._nodeSource;
  set nodeSource(String nodeSource) => _$this._nodeSource = nodeSource;

  CoreMethodInformationBuilder();

  CoreMethodInformationBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _isGetter = _$v.isGetter;
      _isAbstract = _$v.isAbstract;
      _pageObjectType = _$v.pageObjectType;
      _pageObjectTemplate = _$v.pageObjectTemplate;
      _isFuture = _$v.isFuture;
      _isList = _$v.isList;
      _isMouse = _$v.isMouse;
      _finder = _$v.finder;
      _filters = _$v.filters;
      _checkers = _$v.checkers;
      _isRoot = _$v.isRoot;
      _nodeSource = _$v.nodeSource;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CoreMethodInformation other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$CoreMethodInformation;
  }

  @override
  void update(void updates(CoreMethodInformationBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$CoreMethodInformation build() {
    final _$result = _$v ??
        new _$CoreMethodInformation._(
            name: name,
            isGetter: isGetter,
            isAbstract: isAbstract,
            pageObjectType: pageObjectType,
            pageObjectTemplate: pageObjectTemplate,
            isFuture: isFuture,
            isList: isList,
            isMouse: isMouse,
            finder: finder,
            filters: filters,
            checkers: checkers,
            isRoot: isRoot,
            nodeSource: nodeSource);
    replace(_$result);
    return _$result;
  }
}

abstract class CoreMethodInformationBaseBuilder {
  void replace(CoreMethodInformationBase other);
  void update(void updates(CoreMethodInformationBaseBuilder b));
  String get name;
  set name(String name);

  bool get isGetter;
  set isGetter(bool isGetter);

  bool get isAbstract;
  set isAbstract(bool isAbstract);

  String get pageObjectType;
  set pageObjectType(String pageObjectType);

  Optional<String> get pageObjectTemplate;
  set pageObjectTemplate(Optional<String> pageObjectTemplate);

  bool get isFuture;
  set isFuture(bool isFuture);

  bool get isList;
  set isList(bool isList);

  bool get isMouse;
  set isMouse(bool isMouse);

  Optional<String> get finder;
  set finder(Optional<String> finder);

  List<String> get filters;
  set filters(List<String> filters);

  List<String> get checkers;
  set checkers(List<String> checkers);

  bool get isRoot;
  set isRoot(bool isRoot);

  String get nodeSource;
  set nodeSource(String nodeSource);
}
