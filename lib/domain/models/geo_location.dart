import 'dart:convert';

import 'package:flutter/material.dart';

import '../entities/model_entity.dart';

@immutable
class GeoLocation implements ModelEntity {
  const GeoLocation({required this.lat, required this.lng});
  final double lat;
  final double lng;

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{'lat': lat, 'lng': lng};

  @override
  GeoLocation fromJson(Map<String, dynamic> json) => GeoLocation(
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
  );

  @override
  GeoLocation fromString(String jsonString) {
    final Map<String, dynamic> json =
        jsonDecode(jsonString) as Map<String, dynamic>;
    return fromJson(json);
  }

  @override
  GeoLocation copyWith({double? lat, double? lng}) {
    return GeoLocation(lat: lat ?? this.lat, lng: lng ?? this.lng);
  }

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      other is GeoLocation && other.lat == lat && other.lng == lng;

  @override
  int get hashCode => Object.hash(lat, lng);
}
