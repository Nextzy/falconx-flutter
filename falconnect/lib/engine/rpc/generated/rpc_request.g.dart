// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../rpc_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JsonRpcRequest _$JsonRpcRequestFromJson(Map<String, dynamic> json) =>
    _JsonRpcRequest(
      jsonrpc: json['jsonrpc'] as String?,
      method: json['method'] as String?,
      params: json['params'] as Map<String, dynamic>?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$JsonRpcRequestToJson(_JsonRpcRequest instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': instance.id,
      'method': instance.method,
      'params': instance.params,
    };
