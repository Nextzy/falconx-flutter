import 'package:falconnect/lib.dart';

part 'generated/rpc_response.freezed.dart';

part 'generated/rpc_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class JsonRpcResponse<T, E> extends JsonRpc
    with _$JsonRpcResponse<T, E> {
  const factory JsonRpcResponse({
    required String? jsonrpc,
    T? result,
    E? error,
    String? id,
  }) = _JsonRpcResponse<T, E>;

  const JsonRpcResponse._({
    super.jsonrpc,
    super.id,
  }) : super();

  factory JsonRpcResponse.fromJson(Map<String, dynamic> json,
          T Function(Object?) fromJsonT, E Function(Object?) fromJsonE) =>
      _$JsonRpcResponseFromJson(
        json,
        fromJsonT,
        fromJsonE,
      );

  bool get hasResult => result != null;

  bool get isError => error != null;
}
