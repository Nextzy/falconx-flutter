// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../rpc_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RpcBody<T> {
  String? get jsonrpc;
  String? get method;
  T? get params;
  String? get id;

  /// Create a copy of RpcBody
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RpcBodyCopyWith<T, RpcBody<T>> get copyWith =>
      _$RpcBodyCopyWithImpl<T, RpcBody<T>>(this as RpcBody<T>, _$identity);

  /// Serializes this RpcBody to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RpcBody<T> &&
            (identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other.params, params) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jsonrpc, method,
      const DeepCollectionEquality().hash(params), id);

  @override
  String toString() {
    return 'RpcBody<$T>(jsonrpc: $jsonrpc, method: $method, params: $params, id: $id)';
  }
}

/// @nodoc
abstract mixin class $RpcBodyCopyWith<T, $Res> {
  factory $RpcBodyCopyWith(RpcBody<T> value, $Res Function(RpcBody<T>) _then) =
      _$RpcBodyCopyWithImpl;
  @useResult
  $Res call({String? jsonrpc, String? method, T? params, String? id});
}

/// @nodoc
class _$RpcBodyCopyWithImpl<T, $Res> implements $RpcBodyCopyWith<T, $Res> {
  _$RpcBodyCopyWithImpl(this._self, this._then);

  final RpcBody<T> _self;
  final $Res Function(RpcBody<T>) _then;

  /// Create a copy of RpcBody
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jsonrpc = freezed,
    Object? method = freezed,
    Object? params = freezed,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      jsonrpc: freezed == jsonrpc
          ? _self.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String?,
      method: freezed == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _self.params
          : params // ignore: cast_nullable_to_non_nullable
              as T?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _RpcBody<T> extends RpcBody<T> {
  const _RpcBody(
      {required final String? jsonrpc,
      required this.method,
      this.params,
      final String? id})
      : super._(jsonrpc: jsonrpc, id: id);
  factory _RpcBody.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$RpcBodyFromJson(json, fromJsonT);

  @override
  final String? method;
  @override
  final T? params;

  /// Create a copy of RpcBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RpcBodyCopyWith<T, _RpcBody<T>> get copyWith =>
      __$RpcBodyCopyWithImpl<T, _RpcBody<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$RpcBodyToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RpcBody<T> &&
            (identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc) &&
            (identical(other.method, method) || other.method == method) &&
            const DeepCollectionEquality().equals(other.params, params) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, jsonrpc, method,
      const DeepCollectionEquality().hash(params), id);

  @override
  String toString() {
    return 'RpcBody<$T>(jsonrpc: $jsonrpc, method: $method, params: $params, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$RpcBodyCopyWith<T, $Res>
    implements $RpcBodyCopyWith<T, $Res> {
  factory _$RpcBodyCopyWith(
          _RpcBody<T> value, $Res Function(_RpcBody<T>) _then) =
      __$RpcBodyCopyWithImpl;
  @override
  @useResult
  $Res call({String? jsonrpc, String? method, T? params, String? id});
}

/// @nodoc
class __$RpcBodyCopyWithImpl<T, $Res> implements _$RpcBodyCopyWith<T, $Res> {
  __$RpcBodyCopyWithImpl(this._self, this._then);

  final _RpcBody<T> _self;
  final $Res Function(_RpcBody<T>) _then;

  /// Create a copy of RpcBody
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? jsonrpc = freezed,
    Object? method = freezed,
    Object? params = freezed,
    Object? id = freezed,
  }) {
    return _then(_RpcBody<T>(
      jsonrpc: freezed == jsonrpc
          ? _self.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String?,
      method: freezed == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String?,
      params: freezed == params
          ? _self.params
          : params // ignore: cast_nullable_to_non_nullable
              as T?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
