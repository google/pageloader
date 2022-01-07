// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'null_safety.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NullSafety extends NullSafety {
  @override
  final bool enabled;

  factory _$NullSafety([void Function(NullSafetyBuilder)? updates]) =>
      (new NullSafetyBuilder()..update(updates)).build();

  _$NullSafety._({required this.enabled}) : super._() {
    BuiltValueNullFieldError.checkNotNull(enabled, 'NullSafety', 'enabled');
  }

  @override
  NullSafety rebuild(void Function(NullSafetyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NullSafetyBuilder toBuilder() => new NullSafetyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NullSafety && enabled == other.enabled;
  }

  @override
  int get hashCode {
    return $jf($jc(0, enabled.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NullSafety')..add('enabled', enabled))
        .toString();
  }
}

class NullSafetyBuilder implements Builder<NullSafety, NullSafetyBuilder> {
  _$NullSafety? _$v;

  bool? _enabled;
  bool? get enabled => _$this._enabled;
  set enabled(bool? enabled) => _$this._enabled = enabled;

  NullSafetyBuilder();

  NullSafetyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _enabled = $v.enabled;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NullSafety other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NullSafety;
  }

  @override
  void update(void Function(NullSafetyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NullSafety build() {
    final _$result = _$v ??
        new _$NullSafety._(
            enabled: BuiltValueNullFieldError.checkNotNull(
                enabled, 'NullSafety', 'enabled'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
