export 'batch_rpc_request.dart';
export 'rpc_request.dart';
export 'rpc_response.dart';

abstract class JsonRpc {
  const JsonRpc({
    this.jsonrpc = '2.0',
    this.id,
  });

  final String? jsonrpc;
  final String? id;
}
