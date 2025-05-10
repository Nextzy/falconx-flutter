import 'package:falconnect/lib.dart';

class BatchJsonRpcBody<RESPONSE,ERROR> extends JsonRpc {
  const BatchJsonRpcBody({
    super.jsonrpc,
    super.id,
    required this.method,
    this.params,
    this.fromResponseJson,
    this.fromErrorJson,
  }) : super();

  final String? method;
  final Map<String, dynamic>? params;
  final RESPONSE Function(Map<String, dynamic>? json)? fromResponseJson;
  final ERROR Function(Map<String, dynamic>? json)? fromErrorJson;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['method'] = method;
    json['params'] = params;
    json.removeWhere((k, v) => v == null);
    return json;
  }
}
