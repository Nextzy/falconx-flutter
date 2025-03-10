import 'package:falconnect/lib.dart';

class BatchJsonRpcBody<RESPONSE> extends JsonRpc {
  const BatchJsonRpcBody({
    super.jsonrpc,
    super.id,
    required this.method,
    this.params,
    this.toJsonResponse,
  }) : super();

  final String? method;
  final Map<String, dynamic>? params;
  final RESPONSE Function(Map<String, dynamic>? json)? toJsonResponse;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['method'] = method;
    json['params'] = params;
    json.removeWhere((k, v) => v == null);
    return json;
  }
}
