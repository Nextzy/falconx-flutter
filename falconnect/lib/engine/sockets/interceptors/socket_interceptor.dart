import 'dart:collection';
import 'package:falconnect/lib.dart';

class SocketInterceptors extends ListMixin<SocketInterceptor> {
  final _list = <SocketInterceptor>[];

  @override
  int length = 0;

  @override
  SocketInterceptor operator [](int index) {
    return _list[index];
  }

  @override
  void operator []=(int index, SocketInterceptor value) {
    if (_list.length == index) {
      _list.add(value);
    } else {
      _list[index] = value;
    }
  }
}

abstract class SocketInterceptor {
  // TODO(username): Implement interceptor followed dio concept

  void onRequest(SocketOptions options);

  void onResponse(SocketResponse response);

  void onError(SocketException err, SocketOptions options);
}
