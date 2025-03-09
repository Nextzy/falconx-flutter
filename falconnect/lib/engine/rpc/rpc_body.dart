import 'package:falconnect/lib.dart';

class RpcBody<T> extends JsonRpc {
  const RpcBody({
    super.jsonrpc,
    required this.method,
    this.params,
    super.id,
  });

  final String method;
  final T? params;
}
