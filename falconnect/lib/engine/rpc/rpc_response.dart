import 'package:falconnect/lib.dart';

class RpcResponse<T> extends JsonRpc {
  const RpcResponse({
    super.jsonrpc,
    this.result,
    this.error,
    super.id,
  });

  final T? result;
  final Object? error;

  bool get hasResult => result != null;

  bool get isError => error != null;
}
