// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../rpc_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JsonRpcResponse<T> _$JsonRpcResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _JsonRpcResponse<T>(
      jsonrpc: json['jsonrpc'] as String?,
      result: _$nullableGenericFromJson(json['result'], fromJsonT),
      error: json['error'],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$JsonRpcResponseToJson<T>(
  _JsonRpcResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': instance.id,
      'result': _$nullableGenericToJson(instance.result, toJsonT),
      'error': instance.error,
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
