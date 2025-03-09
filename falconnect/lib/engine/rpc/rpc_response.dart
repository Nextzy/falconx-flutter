import 'package:falconnect/lib.dart';

part 'generated/rpc_response.freezed.dart';

part 'generated/rpc_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class RpcResponse<T> extends JsonRpc with _$RpcResponse<T> {
  const RpcResponse._({
    super.jsonrpc,
    super.id,
  }) : super();

  const factory RpcResponse({
    required String? jsonrpc,
    T? result,
    Object? error,
    String? id,
  }) = _RpcResponse<T>;

  factory RpcResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$RpcResponseFromJson(json, fromJsonT);

  bool get hasResult => result != null;

  bool get isError => error != null;
}
