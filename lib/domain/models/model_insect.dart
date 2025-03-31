import 'dart:convert';

import 'package:flutter/widgets.dart';

import '../entities/model_entity.dart';

@immutable
class ModelInsect implements ModelEntity {
  const ModelInsect({
    required this.speciesName,
    required this.urlPhoto,
    required this.geoLocate,
    required this.moreInfoUrl,
  });

  final String speciesName;
  final String urlPhoto;
  final String geoLocate;
  final String moreInfoUrl;

  @override
  ModelInsect copyWith({
    String? speciesName,
    String? urlPhoto,
    String? geoLocate,
    String? moreInfoUrl,
  }) {
    return ModelInsect(
      speciesName: speciesName ?? this.speciesName,
      urlPhoto: urlPhoto ?? this.urlPhoto,
      geoLocate: geoLocate ?? this.geoLocate,
      moreInfoUrl: moreInfoUrl ?? this.moreInfoUrl,
    );
  }

  @override
  ModelInsect fromJson(Map<String, dynamic> json) {
    return ModelInsect(
      speciesName: json['speciesName'].toString(),
      urlPhoto: json['urlPhoto'].toString(),
      geoLocate: json['geoLocate'].toString(),
      moreInfoUrl: json['moreInfoUrl'].toString(),
    );
  }

  @override
  ModelInsect fromString(String jsonStringify) {
    try {
      final Map<String, dynamic> json =
          jsonDecode(jsonStringify) as Map<String, dynamic>; // 😊

      return fromJson(json);
    } catch (e) {
      return ModelInsect(
        speciesName: 'Error specie',
        urlPhoto: '',
        geoLocate: '',
        moreInfoUrl: e.toString(),
      );
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['speciesName'] = speciesName;
    json['urlPhoto'] = urlPhoto;
    json['geoLocate'] = geoLocate;
    json['moreInfoUrl'] = moreInfoUrl;

    return json;
  }

  @override
  bool operator ==(Object other) =>
      other is ModelInsect &&
      other.runtimeType == runtimeType &&
      other.speciesName == speciesName &&
      other.urlPhoto == urlPhoto &&
      other.moreInfoUrl == moreInfoUrl &&
      other.geoLocate == geoLocate;

  @override
  int get hashCode =>
      Object.hash(speciesName, urlPhoto, geoLocate, moreInfoUrl);
}
