import 'package:falconnect/lib.dart';

part 'generated/rpc_response.freezed.dart';

part 'generated/rpc_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class JsonRpcResponse<T> extends JsonRpc with _$JsonRpcResponse<T> {
  const JsonRpcResponse._({
    super.jsonrpc,
    super.id,
  }) : super();

  const factory JsonRpcResponse({
    required String? jsonrpc,
    T? result,
    Object? error,
    String? id,
  }) = _JsonRpcResponse<T>;

  factory JsonRpcResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$JsonRpcResponseFromJson(json, fromJsonT);

  bool get hasResult => result != null;

  bool get isError => error != null;
}
