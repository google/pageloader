// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.unannotated_method;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UnannotatedMethod extends UnannotatedMethod {
  @override
  final String name;
  @override
  final String returnType;
  @override
  final List<FormalParameter> parameters;
  @override
  final Optional<TypeParameterList> typeParameters;

  factory _$UnannotatedMethod(
          [void Function(UnannotatedMethodBuilder)? updates]) =>
      (new UnannotatedMethodBuilder()..update(updates)).build();

  _$UnannotatedMethod._(
      {required this.name,
      required this.returnType,
      required this.parameters,
      required this.typeParameters})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, 'UnannotatedMethod', 'name');
    BuiltValueNullFieldError.checkNotNull(
        returnType, 'UnannotatedMethod', 'returnType');
    BuiltValueNullFieldError.checkNotNull(
        parameters, 'UnannotatedMethod', 'parameters');
    BuiltValueNullFieldError.checkNotNull(
        typeParameters, 'UnannotatedMethod', 'typeParameters');
  }

  @override
  UnannotatedMethod rebuild(void Function(UnannotatedMethodBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UnannotatedMethodBuilder toBuilder() =>
      new UnannotatedMethodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UnannotatedMethod &&
        name == other.name &&
        returnType == other.returnType &&
        parameters == other.parameters &&
        typeParameters == other.typeParameters;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), returnType.hashCode),
            parameters.hashCode),
        typeParameters.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UnannotatedMethod')
          ..add('name', name)
          ..add('returnType', returnType)
          ..add('parameters', parameters)
          ..add('typeParameters', typeParameters))
        .toString();
  }
}

class UnannotatedMethodBuilder
    implements Builder<UnannotatedMethod, UnannotatedMethodBuilder> {
  _$UnannotatedMethod? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _returnType;
  String? get returnType => _$this._returnType;
  set returnType(String? returnType) => _$this._returnType = returnType;

  List<FormalParameter>? _parameters;
  List<FormalParameter>? get parameters => _$this._parameters;
  set parameters(List<FormalParameter>? parameters) =>
      _$this._parameters = parameters;

  Optional<TypeParameterList>? _typeParameters;
  Optional<TypeParameterList>? get typeParameters => _$this._typeParameters;
  set typeParameters(Optional<TypeParameterList>? typeParameters) =>
      _$this._typeParameters = typeParameters;

  UnannotatedMethodBuilder();

  UnannotatedMethodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _returnType = $v.returnType;
      _parameters = $v.parameters;
      _typeParameters = $v.typeParameters;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnannotatedMethod other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UnannotatedMethod;
  }

  @override
  void update(void Function(UnannotatedMethodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UnannotatedMethod build() {
    final _$result = _$v ??
        new _$UnannotatedMethod._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, 'UnannotatedMethod', 'name'),
            returnType: BuiltValueNullFieldError.checkNotNull(
                returnType, 'UnannotatedMethod', 'returnType'),
            parameters: BuiltValueNullFieldError.checkNotNull(
                parameters, 'UnannotatedMethod', 'parameters'),
            typeParameters: BuiltValueNullFieldError.checkNotNull(
                typeParameters, 'UnannotatedMethod', 'typeParameters'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
