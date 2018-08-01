// GENERATED CODE - DO NOT MODIFY BY HAND

part of pageloader.unannotated_method;

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

class _$UnannotatedMethod extends UnannotatedMethod {
  @override
  final String name;
  @override
  final String returnType;
  @override
  final List<FormalParameter> parameters;
  @override
  final Optional<TypeParameterList> typeParameters;

  factory _$UnannotatedMethod([void updates(UnannotatedMethodBuilder b)]) =>
      (new UnannotatedMethodBuilder()..update(updates)).build();

  _$UnannotatedMethod._(
      {this.name, this.returnType, this.parameters, this.typeParameters})
      : super._() {
    if (name == null)
      throw new BuiltValueNullFieldError('UnannotatedMethod', 'name');
    if (returnType == null)
      throw new BuiltValueNullFieldError('UnannotatedMethod', 'returnType');
    if (parameters == null)
      throw new BuiltValueNullFieldError('UnannotatedMethod', 'parameters');
    if (typeParameters == null)
      throw new BuiltValueNullFieldError('UnannotatedMethod', 'typeParameters');
  }

  @override
  UnannotatedMethod rebuild(void updates(UnannotatedMethodBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  UnannotatedMethodBuilder toBuilder() =>
      new UnannotatedMethodBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! UnannotatedMethod) return false;
    return name == other.name &&
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
  _$UnannotatedMethod _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _returnType;
  String get returnType => _$this._returnType;
  set returnType(String returnType) => _$this._returnType = returnType;

  List<FormalParameter> _parameters;
  List<FormalParameter> get parameters => _$this._parameters;
  set parameters(List<FormalParameter> parameters) =>
      _$this._parameters = parameters;

  Optional<TypeParameterList> _typeParameters;
  Optional<TypeParameterList> get typeParameters => _$this._typeParameters;
  set typeParameters(Optional<TypeParameterList> typeParameters) =>
      _$this._typeParameters = typeParameters;

  UnannotatedMethodBuilder();

  UnannotatedMethodBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _returnType = _$v.returnType;
      _parameters = _$v.parameters;
      _typeParameters = _$v.typeParameters;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UnannotatedMethod other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$UnannotatedMethod;
  }

  @override
  void update(void updates(UnannotatedMethodBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$UnannotatedMethod build() {
    final _$result = _$v ??
        new _$UnannotatedMethod._(
            name: name,
            returnType: returnType,
            parameters: parameters,
            typeParameters: typeParameters);
    replace(_$result);
    return _$result;
  }
}
