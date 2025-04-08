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
mixin _$JsonRpcResponse<T, E> {
  String? get jsonrpc;
  T? get result;
  E? get error;
  String? get id;

  /// Create a copy of JsonRpcResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $JsonRpcResponseCopyWith<T, E, JsonRpcResponse<T, E>> get copyWith =>
      _$JsonRpcResponseCopyWithImpl<T, E, JsonRpcResponse<T, E>>(
          this as JsonRpcResponse<T, E>, _$identity);

  /// Serializes this JsonRpcResponse to a JSON map.
  Map<String, dynamic> toJson(
      Object? Function(T) toJsonT, Object? Function(E) toJsonE);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is JsonRpcResponse<T, E> &&
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
    return 'JsonRpcResponse<$T, $E>(jsonrpc: $jsonrpc, result: $result, error: $error, id: $id)';
  }
}

/// @nodoc
abstract mixin class $JsonRpcResponseCopyWith<T, E, $Res> {
  factory $JsonRpcResponseCopyWith(JsonRpcResponse<T, E> value,
          $Res Function(JsonRpcResponse<T, E>) _then) =
      _$JsonRpcResponseCopyWithImpl;
  @useResult
  $Res call({String? jsonrpc, T? result, E? error, String? id});
}

/// @nodoc
class _$JsonRpcResponseCopyWithImpl<T, E, $Res>
    implements $JsonRpcResponseCopyWith<T, E, $Res> {
  _$JsonRpcResponseCopyWithImpl(this._self, this._then);

  final JsonRpcResponse<T, E> _self;
  final $Res Function(JsonRpcResponse<T, E>) _then;

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
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as E?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _JsonRpcResponse<T, E> extends JsonRpcResponse<T, E> {
  const _JsonRpcResponse(
      {required final String? jsonrpc,
      this.result,
      this.error,
      final String? id})
      : super._(jsonrpc: jsonrpc, id: id);
  factory _JsonRpcResponse.fromJson(Map<String, dynamic> json,
          T Function(Object?) fromJsonT, E Function(Object?) fromJsonE) =>
      _$JsonRpcResponseFromJson(json, fromJsonT, fromJsonE);

  @override
  final T? result;
  @override
  final E? error;

  /// Create a copy of JsonRpcResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$JsonRpcResponseCopyWith<T, E, _JsonRpcResponse<T, E>> get copyWith =>
      __$JsonRpcResponseCopyWithImpl<T, E, _JsonRpcResponse<T, E>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(
      Object? Function(T) toJsonT, Object? Function(E) toJsonE) {
    return _$JsonRpcResponseToJson<T, E>(this, toJsonT, toJsonE);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JsonRpcResponse<T, E> &&
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
    return 'JsonRpcResponse<$T, $E>(jsonrpc: $jsonrpc, result: $result, error: $error, id: $id)';
  }
}

/// @nodoc
abstract mixin class _$JsonRpcResponseCopyWith<T, E, $Res>
    implements $JsonRpcResponseCopyWith<T, E, $Res> {
  factory _$JsonRpcResponseCopyWith(_JsonRpcResponse<T, E> value,
          $Res Function(_JsonRpcResponse<T, E>) _then) =
      __$JsonRpcResponseCopyWithImpl;
  @override
  @useResult
  $Res call({String? jsonrpc, T? result, E? error, String? id});
}

/// @nodoc
class __$JsonRpcResponseCopyWithImpl<T, E, $Res>
    implements _$JsonRpcResponseCopyWith<T, E, $Res> {
  __$JsonRpcResponseCopyWithImpl(this._self, this._then);

  final _JsonRpcResponse<T, E> _self;
  final $Res Function(_JsonRpcResponse<T, E>) _then;

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
    return _then(_JsonRpcResponse<T, E>(
      jsonrpc: freezed == jsonrpc
          ? _self.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String?,
      result: freezed == result
          ? _self.result
          : result // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as E?,
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
