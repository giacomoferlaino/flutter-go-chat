import 'dart:convert';

import 'package:flutter/foundation.dart';

class Url {
  final String scheme;
  final String host;
  final int port;

  const Url({
    @required this.scheme,
    @required this.host,
    @required this.port,
  });

  Url copyWith({
    String scheme,
    String host,
    int port,
  }) {
    return Url(
      scheme: scheme ?? this.scheme,
      host: host ?? this.host,
      port: port ?? this.port,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'scheme': scheme,
      'host': host,
      'port': port,
    };
  }

  factory Url.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Url(
      scheme: map['scheme'],
      host: map['host'],
      port: map['port'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Url.fromJson(String source) => Url.fromMap(json.decode(source));

  @override
  String toString() => '$scheme://$host:$port/';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Url && o.scheme == scheme && o.host == host && o.port == port;
  }

  @override
  int get hashCode => scheme.hashCode ^ host.hashCode ^ port.hashCode;
}
