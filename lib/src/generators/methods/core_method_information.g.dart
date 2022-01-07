// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.core_method_information;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TypeInformation extends TypeInformation {
  @override
  final String type;
  @override
  final List<TypeInformation> typeArguments;

  factory _$TypeInformation([void Function(TypeInformationBuilder)? updates]) =>
      (new TypeInformationBuilder()..update(updates)).build();

  _$TypeInformation._({required this.type, required this.typeArguments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(type, 'TypeInformation', 'type');
    BuiltValueNullFieldError.checkNotNull(
        typeArguments, 'TypeInformation', 'typeArguments');
  }

  @override
  TypeInformation rebuild(void Function(TypeInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TypeInformationBuilder toBuilder() =>
      new TypeInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TypeInformation &&
        type == other.type &&
        typeArguments == other.typeArguments;
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
  _$TypeInformation? _$v;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  List<TypeInformation>? _typeArguments;
  List<TypeInformation>? get typeArguments => _$this._typeArguments;
  set typeArguments(List<TypeInformation>? typeArguments) =>
      _$this._typeArguments = typeArguments;

  TypeInformationBuilder();

  TypeInformationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _typeArguments = $v.typeArguments;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TypeInformation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TypeInformation;
  }

  @override
  void update(void Function(TypeInformationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TypeInformation build() {
    final _$result = _$v ??
        new _$TypeInformation._(
            type: BuiltValueNullFieldError.checkNotNull(
                type, 'TypeInformation', 'type'),
            typeArguments: BuiltValueNullFieldError.checkNotNull(
                typeArguments, 'TypeInformation', 'typeArguments'));
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
  final bool isPointer;
  @override
  final Optional<String> finder;
  @override
  final List<String> filters;
  @override
  final List<String> checkers;
  @override
  final bool isRoot;
  @override
  final bool isNullElement;
  @override
  final String nodeSource;
  @override
  final AstNode node;

  factory _$CoreMethodInformation(
          [void Function(CoreMethodInformationBuilder)? updates]) =>
      (new CoreMethodInformationBuilder()..update(updates)).build();

  _$CoreMethodInformation._(
      {required this.name,
      required this.isGetter,
      required this.isAbstract,
      required this.pageObjectType,
      required this.pageObjectTemplate,
      required this.isFuture,
      required this.isList,
      required this.isMouse,
      required this.isPointer,
      required this.finder,
      required this.filters,
      required this.checkers,
      required this.isRoot,
      required this.isNullElement,
      required this.nodeSource,
      required this.node})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        name, 'CoreMethodInformation', 'name');
    BuiltValueNullFieldError.checkNotNull(
        isGetter, 'CoreMethodInformation', 'isGetter');
    BuiltValueNullFieldError.checkNotNull(
        isAbstract, 'CoreMethodInformation', 'isAbstract');
    BuiltValueNullFieldError.checkNotNull(
        pageObjectType, 'CoreMethodInformation', 'pageObjectType');
    BuiltValueNullFieldError.checkNotNull(
        pageObjectTemplate, 'CoreMethodInformation', 'pageObjectTemplate');
    BuiltValueNullFieldError.checkNotNull(
        isFuture, 'CoreMethodInformation', 'isFuture');
    BuiltValueNullFieldError.checkNotNull(
        isList, 'CoreMethodInformation', 'isList');
    BuiltValueNullFieldError.checkNotNull(
        isMouse, 'CoreMethodInformation', 'isMouse');
    BuiltValueNullFieldError.checkNotNull(
        isPointer, 'CoreMethodInformation', 'isPointer');
    BuiltValueNullFieldError.checkNotNull(
        finder, 'CoreMethodInformation', 'finder');
    BuiltValueNullFieldError.checkNotNull(
        filters, 'CoreMethodInformation', 'filters');
    BuiltValueNullFieldError.checkNotNull(
        checkers, 'CoreMethodInformation', 'checkers');
    BuiltValueNullFieldError.checkNotNull(
        isRoot, 'CoreMethodInformation', 'isRoot');
    BuiltValueNullFieldError.checkNotNull(
        isNullElement, 'CoreMethodInformation', 'isNullElement');
    BuiltValueNullFieldError.checkNotNull(
        nodeSource, 'CoreMethodInformation', 'nodeSource');
    BuiltValueNullFieldError.checkNotNull(
        node, 'CoreMethodInformation', 'node');
  }

  @override
  CoreMethodInformation rebuild(
          void Function(CoreMethodInformationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CoreMethodInformationBuilder toBuilder() =>
      new CoreMethodInformationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CoreMethodInformation &&
        name == other.name &&
        isGetter == other.isGetter &&
        isAbstract == other.isAbstract &&
        pageObjectType == other.pageObjectType &&
        pageObjectTemplate == other.pageObjectTemplate &&
        isFuture == other.isFuture &&
        isList == other.isList &&
        isMouse == other.isMouse &&
        isPointer == other.isPointer &&
        finder == other.finder &&
        filters == other.filters &&
        checkers == other.checkers &&
        isRoot == other.isRoot &&
        isNullElement == other.isNullElement &&
        nodeSource == other.nodeSource &&
        node == other.node;
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    name
                                                                        .hashCode),
                                                                isGetter
                                                                    .hashCode),
                                                            isAbstract
                                                                .hashCode),
                                                        pageObjectType
                                                            .hashCode),
                                                    pageObjectTemplate
                                                        .hashCode),
                                                isFuture.hashCode),
                                            isList.hashCode),
                                        isMouse.hashCode),
                                    isPointer.hashCode),
                                finder.hashCode),
                            filters.hashCode),
                        checkers.hashCode),
                    isRoot.hashCode),
                isNullElement.hashCode),
            nodeSource.hashCode),
        node.hashCode));
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
          ..add('isPointer', isPointer)
          ..add('finder', finder)
          ..add('filters', filters)
          ..add('checkers', checkers)
          ..add('isRoot', isRoot)
          ..add('isNullElement', isNullElement)
          ..add('nodeSource', nodeSource)
          ..add('node', node))
        .toString();
  }
}

class CoreMethodInformationBuilder
    implements
        Builder<CoreMethodInformation, CoreMethodInformationBuilder>,
        CoreMethodInformationBaseBuilder {
  _$CoreMethodInformation? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(covariant String? name) => _$this._name = name;

  bool? _isGetter;
  bool? get isGetter => _$this._isGetter;
  set isGetter(covariant bool? isGetter) => _$this._isGetter = isGetter;

  bool? _isAbstract;
  bool? get isAbstract => _$this._isAbstract;
  set isAbstract(covariant bool? isAbstract) => _$this._isAbstract = isAbstract;

  String? _pageObjectType;
  String? get pageObjectType => _$this._pageObjectType;
  set pageObjectType(covariant String? pageObjectType) =>
      _$this._pageObjectType = pageObjectType;

  Optional<String>? _pageObjectTemplate;
  Optional<String>? get pageObjectTemplate => _$this._pageObjectTemplate;
  set pageObjectTemplate(covariant Optional<String>? pageObjectTemplate) =>
      _$this._pageObjectTemplate = pageObjectTemplate;

  bool? _isFuture;
  bool? get isFuture => _$this._isFuture;
  set isFuture(covariant bool? isFuture) => _$this._isFuture = isFuture;

  bool? _isList;
  bool? get isList => _$this._isList;
  set isList(covariant bool? isList) => _$this._isList = isList;

  bool? _isMouse;
  bool? get isMouse => _$this._isMouse;
  set isMouse(covariant bool? isMouse) => _$this._isMouse = isMouse;

  bool? _isPointer;
  bool? get isPointer => _$this._isPointer;
  set isPointer(covariant bool? isPointer) => _$this._isPointer = isPointer;

  Optional<String>? _finder;
  Optional<String>? get finder => _$this._finder;
  set finder(covariant Optional<String>? finder) => _$this._finder = finder;

  List<String>? _filters;
  List<String>? get filters => _$this._filters;
  set filters(covariant List<String>? filters) => _$this._filters = filters;

  List<String>? _checkers;
  List<String>? get checkers => _$this._checkers;
  set checkers(covariant List<String>? checkers) => _$this._checkers = checkers;

  bool? _isRoot;
  bool? get isRoot => _$this._isRoot;
  set isRoot(covariant bool? isRoot) => _$this._isRoot = isRoot;

  bool? _isNullElement;
  bool? get isNullElement => _$this._isNullElement;
  set isNullElement(covariant bool? isNullElement) =>
      _$this._isNullElement = isNullElement;

  String? _nodeSource;
  String? get nodeSource => _$this._nodeSource;
  set nodeSource(covariant String? nodeSource) =>
      _$this._nodeSource = nodeSource;

  AstNode? _node;
  AstNode? get node => _$this._node;
  set node(covariant AstNode? node) => _$this._node = node;

  CoreMethodInformationBuilder();

  CoreMethodInformationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _isGetter = $v.isGetter;
      _isAbstract = $v.isAbstract;
      _pageObjectType = $v.pageObjectType;
      _pageObjectTemplate = $v.pageObjectTemplate;
      _isFuture = $v.isFuture;
      _isList = $v.isList;
      _isMouse = $v.isMouse;
      _isPointer = $v.isPointer;
      _finder = $v.finder;
      _filters = $v.filters;
      _checkers = $v.checkers;
      _isRoot = $v.isRoot;
      _isNullElement = $v.isNullElement;
      _nodeSource = $v.nodeSource;
      _node = $v.node;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CoreMethodInformation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CoreMethodInformation;
  }

  @override
  void update(void Function(CoreMethodInformationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CoreMethodInformation build() {
    final _$result = _$v ??
        new _$CoreMethodInformation._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'CoreMethodInformation', 'name'),
            isGetter: BuiltValueNullFieldError.checkNotNull(
                isGetter, 'CoreMethodInformation', 'isGetter'),
            isAbstract: BuiltValueNullFieldError.checkNotNull(
                isAbstract, 'CoreMethodInformation', 'isAbstract'),
            pageObjectType: BuiltValueNullFieldError.checkNotNull(
                pageObjectType, 'CoreMethodInformation', 'pageObjectType'),
            pageObjectTemplate: BuiltValueNullFieldError.checkNotNull(
                pageObjectTemplate, 'CoreMethodInformation', 'pageObjectTemplate'),
            isFuture: BuiltValueNullFieldError.checkNotNull(
                isFuture, 'CoreMethodInformation', 'isFuture'),
            isList: BuiltValueNullFieldError.checkNotNull(
                isList, 'CoreMethodInformation', 'isList'),
            isMouse: BuiltValueNullFieldError.checkNotNull(
                isMouse, 'CoreMethodInformation', 'isMouse'),
            isPointer: BuiltValueNullFieldError.checkNotNull(isPointer, 'CoreMethodInformation', 'isPointer'),
            finder: BuiltValueNullFieldError.checkNotNull(finder, 'CoreMethodInformation', 'finder'),
            filters: BuiltValueNullFieldError.checkNotNull(filters, 'CoreMethodInformation', 'filters'),
            checkers: BuiltValueNullFieldError.checkNotNull(checkers, 'CoreMethodInformation', 'checkers'),
            isRoot: BuiltValueNullFieldError.checkNotNull(isRoot, 'CoreMethodInformation', 'isRoot'),
            isNullElement: BuiltValueNullFieldError.checkNotNull(isNullElement, 'CoreMethodInformation', 'isNullElement'),
            nodeSource: BuiltValueNullFieldError.checkNotNull(nodeSource, 'CoreMethodInformation', 'nodeSource'),
            node: BuiltValueNullFieldError.checkNotNull(node, 'CoreMethodInformation', 'node'));
    replace(_$result);
    return _$result;
  }
}

abstract class CoreMethodInformationBaseBuilder {
  void replace(CoreMethodInformationBase other);
  void update(void Function(CoreMethodInformationBaseBuilder) updates);
  String? get name;
  set name(String? name);

  bool? get isGetter;
  set isGetter(bool? isGetter);

  bool? get isAbstract;
  set isAbstract(bool? isAbstract);

  String? get pageObjectType;
  set pageObjectType(String? pageObjectType);

  Optional<String>? get pageObjectTemplate;
  set pageObjectTemplate(Optional<String>? pageObjectTemplate);

  bool? get isFuture;
  set isFuture(bool? isFuture);

  bool? get isList;
  set isList(bool? isList);

  bool? get isMouse;
  set isMouse(bool? isMouse);

  bool? get isPointer;
  set isPointer(bool? isPointer);

  Optional<String>? get finder;
  set finder(Optional<String>? finder);

  List<String>? get filters;
  set filters(List<String>? filters);

  List<String>? get checkers;
  set checkers(List<String>? checkers);

  bool? get isRoot;
  set isRoot(bool? isRoot);

  bool? get isNullElement;
  set isNullElement(bool? isNullElement);

  String? get nodeSource;
  set nodeSource(String? nodeSource);

  AstNode? get node;
  set node(AstNode? node);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
