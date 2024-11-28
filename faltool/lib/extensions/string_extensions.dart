import 'package:faltool/lib.dart';
import 'dart:convert';

extension FalconToolStringExtension on String {
  static const _urlPattern =
      r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

  String get removeWhiteSpace => replaceAll(RegExp(r"\s+"), "");

  bool get isUrl {
    final regexUrl = RegExp(_urlPattern, caseSensitive: false);
    return regexUrl.hasMatch(this);
  }

  bool get isJson {
    try {
      json.decode(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get isNotJson => !isJson;

  bool get isNotUrl => !isUrl;

  int toIntOrZero() {
    final noWhitSpace = removeWhiteSpace;
    if (noWhitSpace.isEmpty) return 0;
    return noWhitSpace.toInt();
  }

  String get removeHttp => replaceAll(RegExp(r'https?://'), '');

  Map<String, dynamic> toMap() {
    return json.decode(this);
  }

  Map<String, dynamic>? toMapOrNull() {
    try {
      return json.decode(this);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> toMapOrEmpty() {
    try {
      return json.decode(this);
    } catch (e) {
      return {};
    }
  }

  bool toBoolean() {
    return (toLowerCase() == "true" || toLowerCase() == "1")
        ? true
        : (toLowerCase() == "false" || toLowerCase() == "0"
            ? false
            : throw UnsupportedError(
                'String is not support convert to boolean.'));
  }

  bool? toBooleanOrNull() {
    return (toLowerCase() == "true" || toLowerCase() == "1")
        ? true
        : (toLowerCase() == "false" || toLowerCase() == "0" ? false : null);
  }
}

extension FalconStringNullExtension on String? {
  static const _urlPattern =
      r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";

  String? get removeWhiteSpace => this?.replaceAll(RegExp(r"\s+"), "");

  bool get isUrl {
    final regexUrl = RegExp(_urlPattern, caseSensitive: false);
    return regexUrl.hasMatch(this ?? '');
  }

  bool get isJson {
    try {
      json.decode(this!);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get isNotJson => !isJson;

  bool get isNotUrl => !isUrl;

  int toIntOrZero() {
    final noWhitSpace = removeWhiteSpace;
    if (noWhitSpace?.isEmpty == true) return 0;
    return noWhitSpace?.toInt() ?? 0;
  }

  bool toBoolean() {
    return (this?.toLowerCase() == "true" || this?.toLowerCase() == "1")
        ? true
        : (this?.toLowerCase() == "false" || this?.toLowerCase() == "0"
            ? false
            : throw UnsupportedError(
                'String is not support convert to boolean.'));
  }

  bool? toBooleanOrNull() {
    return (this?.toLowerCase() == "true" || this?.toLowerCase() == "1")
        ? true
        : (this?.toLowerCase() == "false" || this?.toLowerCase() == "0"
            ? false
            : null);
  }

  Map<String, dynamic> toMap() {
    return json.decode(this!);
  }

  Map<String, dynamic>? toMapOrNull() {
    try {
      return json.decode(this!);
    } catch (e) {
      return null;
    }
  }

  Map<String, dynamic> toMapOrEmpty() {
    try {
      return json.decode(this!);
    } catch (e) {
      return {};
    }
  }
}
