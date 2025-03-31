import 'dart:convert';

import 'package:flutter/material.dart';

import '../entities/model_entity.dart';

@immutable
class ModelEntomologist implements ModelEntity {
  const ModelEntomologist({
    required this.name,
    required this.urlPhoto,
    required this.geoLocate,
  });
  final String name;
  final String urlPhoto;
  final String geoLocate;

  @override
  ModelEntomologist copyWith({
    String? name,
    String? urlPhoto,
    String? geoLocate,
  }) {
    return ModelEntomologist(
      name: name ?? this.name,
      urlPhoto: urlPhoto ?? this.urlPhoto,
      geoLocate: geoLocate ?? this.geoLocate,
    );
  }

  @override
  ModelEntomologist fromJson(Map<String, dynamic> json) {
    return ModelEntomologist(
      name: json['name'].toString(),
      urlPhoto: json['urlPhoto'].toString(),
      geoLocate: json['geoLocate'].toString(),
    );
  }

  @override
  ModelEntomologist fromString(String jsonString) {
    final Map<String, dynamic> json =
        jsonDecode(jsonString) as Map<String, dynamic>;
    return fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'name': name,
    'urlPhoto': urlPhoto,
    'geoLocate': geoLocate,
  };

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      other is ModelEntomologist &&
      other.name == name &&
      other.urlPhoto == urlPhoto &&
      other.geoLocate == geoLocate;

  @override
  int get hashCode => Object.hash(name, urlPhoto, geoLocate);
}
