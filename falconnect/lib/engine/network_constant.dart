class HttpHeader {
  static const AUTHORIZE = 'Authorization';
  static const ACCEPT_LANGUAGE = 'Accept-Language';
  static const CACHE_CONTROL = 'Cache-Control';
  static const CONTENT_TYPE = 'Content-Type';
  static const CONTENT_LENGTH = 'Content-Length';
  static const COOKIE = 'Cookie';
  static const KEEP_ALIVE = 'Keep-Alive';
  static const ORIGIN = 'Origin';
  static const USER_AGENT = 'User-Agent';
  static const X_API_KEY = 'x-api-key';
}

class HttpCode {
  static const SUCCESS = 200;
  static const ERROR_UNAUTHORIZED = 401;
  static const ERROR_NOT_FOUND = 404;
  static const ERROR_INTERNAL = 500;
}
