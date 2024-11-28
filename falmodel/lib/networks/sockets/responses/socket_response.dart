import 'package:falmodel/lib.dart';

class SocketResponse extends BaseRequest {
  const SocketResponse({
    required this.requestOptions,
    required this.data,
  });

  final SocketOptions requestOptions;
  final String data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocketResponse &&
          runtimeType == other.runtimeType &&
          requestOptions == other.requestOptions &&
          data == other.data);

  @override
  int get hashCode => requestOptions.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'SocketResponse{options: $requestOptions, data: $data,}';
  }

  @override
  List<Object?> get props => [requestOptions, data];
}
