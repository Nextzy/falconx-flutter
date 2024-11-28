class SocketOptions {
  SocketOptions({
    this.uri = '',
    this.retryLimit = 3,
    this.protocol,
    this.data,
  });

  String uri;
  int retryLimit;
  String? protocol;
  String? data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SocketOptions &&
          runtimeType == other.runtimeType &&
          uri == other.uri &&
          retryLimit == other.retryLimit &&
          protocol == other.protocol &&
          data == other.data);

  @override
  int get hashCode =>
      uri.hashCode ^ retryLimit.hashCode ^ data.hashCode ^ protocol.hashCode;

  @override
  String toString() {
    return 'SocketOptions{ uri: $uri, retryLimit: $retryLimit, protocol: $protocol, data: $data,}';
  }

  SocketOptions copyWith({
    String? uri,
    int? retryLimit,
    String? protocol,
    dynamic data,
  }) {
    return SocketOptions(
      uri: uri ?? this.uri,
      retryLimit: retryLimit ?? this.retryLimit,
      protocol: protocol ?? this.protocol,
      data: data ?? this.data,
    );
  }
}
