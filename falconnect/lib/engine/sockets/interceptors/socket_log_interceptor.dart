import 'package:falconnect/lib.dart';
import 'package:flutter/foundation.dart';

class SocketLogInterceptor extends SocketInterceptor {
  SocketLogInterceptor({
    this.requestBody = true,
    this.responseBody = true,
    this.error = true,
    this.logPrint = _logPrintLong,
  }) {
    ansiColorDisabled = kReleaseMode;
  }

  final AnsiPen _title = AnsiPen()..white(bold: true);
  final AnsiPen _error = AnsiPen()..red(bold: true);
  final AnsiPen _json = AnsiPen()..green(bold: true);

  /// Print request data
  bool requestBody;

  /// Print [Response.data]
  bool responseBody;

  /// Print error message
  bool error;

  void Function(Object? object) logPrint;

  @override
  void onRequest(SocketOptions options) async {
    if (!kReleaseMode) {
      logPrint(_title('*** Socket Request ↗️ ***'));
      _printKV('URL', options.uri);
      _printKV('Protocol', options.protocol);

      if (requestBody) {
        final data = options.data;
        const encoder = JsonEncoder.withIndent('  ');
        String prettyPrint;
        logPrint(_json('Body Data:'));
        prettyPrint = encoder.convert(data);
        _printAll(_json(prettyPrint));
      }
      logPrint('');
    }
  }

  @override
  void onResponse(SocketResponse response) async {
    if (!kReleaseMode) {
      logPrint(_title('*** Socket Response ↙️ ***'));
      _printResponse(response);
    }
  }

  @override
  void onError(SocketException err, SocketOptions options) async {
    if (!kReleaseMode) {
      if (error) {
        logPrint(_error('*** DioError ❌ ***:'));
        logPrint('URL: ${options.uri}');
        logPrint('$err');
        final response = err.response;
        if (response != null) {
          _printResponse(response);
        }
        logPrint('');
      }
    }
  }

  void _printResponse(SocketResponse response) {
    if (!kReleaseMode) {
      _printKV('URL', response.requestOptions.uri);
      _printKV('Protocol', response.requestOptions.protocol);
      if (responseBody) {
        logPrint(_json('Response Text:'));
        const encoder = JsonEncoder.withIndent('  ');
        final prettyPrint = encoder.convert(response.data);
        _printAll(_json(prettyPrint));
      }
      logPrint('');
    }
  }

  void _printKV(String key, Object? v) {
    if (!kReleaseMode) {
      logPrint('$key: $v');
    }
  }

  void _printAll(Object msg) {
    if (!kReleaseMode) {
      msg.toString().split('\n').forEach(logPrint);
    }
  }

  static void _logPrintLong(Object? object) async {
    if (kDebugMode) {
      const defaultPrintLength = 1020;
      if (object == null || object.toString().length <= defaultPrintLength) {
        print(object);
      } else {
        final log = object.toString();
        var start = 0;
        var endIndex = defaultPrintLength;
        final logLength = log.length;
        var tmpLogLength = log.length;
        while (endIndex < logLength) {
          print(log.substring(start, endIndex));
          endIndex += defaultPrintLength;
          start += defaultPrintLength;
          tmpLogLength -= defaultPrintLength;
        }
        if (tmpLogLength > 0) {
          print(log.substring(start, logLength));
        }
      }
    }
  }
}
