import 'package:falconnect/lib.dart';

part 'generated/rpc_request.freezed.dart';

part 'generated/rpc_request.g.dart';

@freezed
abstract class JsonRpcRequest extends JsonRpc with _$JsonRpcRequest {
  const JsonRpcRequest._({
    super.jsonrpc,
    super.id,
  }) : super();

  const factory JsonRpcRequest({
    required String? jsonrpc,
    required String? method,
    Map<String, dynamic>? params,
    String? id,
  }) = _JsonRpcRequest;

  factory JsonRpcRequest.fromJson( Map<String, dynamic> json) =>
      _$JsonRpcRequestFromJson(json);
}
