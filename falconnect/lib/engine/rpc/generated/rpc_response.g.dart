// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../rpc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JsonRpcResponse<T, E> _$JsonRpcResponseFromJson<T, E>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
  E Function(Object? json) fromJsonE,
) =>
    _JsonRpcResponse<T, E>(
      jsonrpc: json['jsonrpc'] as String?,
      result: _$nullableGenericFromJson(json['result'], fromJsonT),
      error: _$nullableGenericFromJson(json['error'], fromJsonE),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$JsonRpcResponseToJson<T, E>(
  _JsonRpcResponse<T, E> instance,
  Object? Function(T value) toJsonT,
  Object? Function(E value) toJsonE,
) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': instance.id,
      'result': _$nullableGenericToJson(instance.result, toJsonT),
      'error': _$nullableGenericToJson(instance.error, toJsonE),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
