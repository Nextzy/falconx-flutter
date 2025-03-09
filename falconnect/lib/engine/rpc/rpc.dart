import 'package:falconnect/lib.dart';

export 'rpc_body.dart';
export 'rpc_response.dart';

abstract class JsonRpc {
  const JsonRpc({
    this.jsonrpc = "2.0",
    this.id,
  });

  final String jsonrpc;
  final String? id;
}
