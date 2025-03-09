import 'package:falconnect/lib.dart';

part 'generated/rpc_body.freezed.dart';

part 'generated/rpc_body.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class RpcBody<T> extends JsonRpc with _$RpcBody<T> {
  const RpcBody._({
    super.jsonrpc,
    super.id,
  }) : super();

  const factory RpcBody({
    required String? jsonrpc,
    required String? method,
    T? params,
    String? id,
  }) = _RpcBody<T>;

  factory RpcBody.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$RpcBodyFromJson(json, fromJsonT);
}
