// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../rpc_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RpcBody<T> _$RpcBodyFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _RpcBody<T>(
      jsonrpc: json['jsonrpc'] as String?,
      method: json['method'] as String?,
      params: _$nullableGenericFromJson(json['params'], fromJsonT),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RpcBodyToJson<T>(
  _RpcBody<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': instance.id,
      'method': instance.method,
      'params': _$nullableGenericToJson(instance.params, toJsonT),
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
