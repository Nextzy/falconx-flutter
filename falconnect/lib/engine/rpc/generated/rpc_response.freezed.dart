// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../rpc_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JsonRpcResponse<T> {
  String? get jsonrpc;
  T? get result;
  Object? get error;
  String? get id;

  /// Create a copy of JsonRpcResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsonRpcResponseCopyWith<T, JsonRpcResponse<T>> get copyWith =>
      _$JsonRpcResponseCopyWithImpl<T, JsonRpcResponse<T>>(
          this as JsonRpcResponse<T>, _$identity);

  /// Serializes this JsonRpcResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsonRpcResponse<T> &&
            (identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jsonrpc,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(error),
      id);

  @override
  String toString() {
    return 'JsonRpcResponse<$T>(jsonrpc: $jsonrpc, result: $result, error: $error, id: $id)';
  }
}

/// @nodoc
abstract mixin class $JsonRpcResponseCopyWith<T, $Res> {
  factory $JsonRpcResponseCopyWith(
          JsonRpcResponse<T> value, $Res Function(JsonRpcResponse<T>) _then) =
      _$JsonRpcResponseCopyWithImpl;
  @useResult
  $Res call({String? jsonrpc, T? result, Object? error, String? id});
}

/// @nodoc
class _$JsonRpcResponseCopyWithImpl<T, $Res>
    implements $JsonRpcResponseCopyWith<T, $Res> {
  _$JsonRpcResponseCopyWithImpl(this._self, this._then);

  final JsonRpcResponse<T> _self;
  final $Res Function(JsonRpcResponse<T>) _then;

  /// Create a copy of JsonRpcResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jsonrpc = freezed,
    Object? result = freezed,
    Object? error = freezed,
    Object? id = freezed,
  }) {
    return _then(_self.copyWith(
      jsonrpc: freezed == jsonrpc
          ? _self.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error ? _self.error : error,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _JsonRpcResponse<T> extends JsonRpcResponse<T> {
  const _JsonRpcResponse(
      {required final String? jsonrpc,
      this.result,
      this.error,
      final String? id})
      : super._(jsonrpc: jsonrpc, id: id);
  factory _JsonRpcResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$JsonRpcResponseFromJson(json, fromJsonT);

  @override
  final T? result;
  @override
  final Object? error;

  /// Create a copy of JsonRpcResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JsonRpcResponseCopyWith<T, _JsonRpcResponse<T>> get copyWith =>
      __$JsonRpcResponseCopyWithImpl<T, _JsonRpcResponse<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$JsonRpcResponseToJson<T>(this, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JsonRpcResponse<T> &&
            (identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc) &&
            const DeepCollectionEquality().equals(other.result, result) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jsonrpc,
      const DeepCollectionEquality().hash(result),
      const DeepCollectionEquality().hash(error),
      id);

  @override
  String toString() {
    return 'JsonRpcResponse<$T>(jsonrpc: $jsonrpc, result: $result, error: $error, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$JsonRpcResponseCopyWith<T, $Res>
    implements $JsonRpcResponseCopyWith<T, $Res> {
  factory _$JsonRpcResponseCopyWith(
          _JsonRpcResponse<T> value, $Res Function(_JsonRpcResponse<T>) _then) =
      __$JsonRpcResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String? jsonrpc, T? result, Object? error, String? id});
}

/// @nodoc
class __$JsonRpcResponseCopyWithImpl<T, $Res>
    implements _$JsonRpcResponseCopyWith<T, $Res> {
  __$JsonRpcResponseCopyWithImpl(this._self, this._then);

  final _JsonRpcResponse<T> _self;
  final $Res Function(_JsonRpcResponse<T>) _then;

  /// Create a copy of JsonRpcResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? jsonrpc = freezed,
    Object? result = freezed,
    Object? error = freezed,
    Object? id = freezed,
  }) {
    return _then(_JsonRpcResponse<T>(
      jsonrpc: freezed == jsonrpc
          ? _self.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error ? _self.error : error,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
