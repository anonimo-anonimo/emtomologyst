import 'dart:convert';

import 'package:flutter/material.dart';

import '../entities/model_entity.dart';

@immutable
class ModelCountRecord implements ModelEntity {
  const ModelCountRecord({
    required this.insectType,
    required this.geolocation,
    required this.comment,
    required this.count,
  });

  final String insectType;
  final String geolocation;
  final String comment;
  final int count;

  @override
  ModelCountRecord copyWith({
    String? insectType,
    String? geolocation,
    String? comment,
    int? count,
  }) {
    return ModelCountRecord(
      insectType: insectType ?? this.insectType,
      geolocation: geolocation ?? this.geolocation,
      comment: comment ?? this.comment,
      count: count ?? this.count,
    );
  }

  @override
  ModelCountRecord fromJson(Map<String, dynamic> json) {
    return ModelCountRecord(
      insectType: json['insectType'].toString(),
      geolocation: json['geolocation'].toString(),
      comment: json['comment'].toString(),
      count: int.tryParse(json['count'].toString()) ?? 0,
    );
  }

  @override
  ModelCountRecord fromString(String jsonString) {
    final Map<String, dynamic> json =
        jsonDecode(jsonString) as Map<String, dynamic>;
    return fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
    'insectType': insectType,
    'geolocation': geolocation,
    'comment': comment,
    'count': count,
  };

  @override
  String toString() => jsonEncode(toJson());

  @override
  bool operator ==(Object other) =>
      other is ModelCountRecord &&
      other.insectType == insectType &&
      other.geolocation == geolocation &&
      other.comment == comment &&
      other.count == count;

  @override
  int get hashCode => Object.hash(insectType, geolocation, comment, count);
  String get label{
    if(count >= 0 && count <10 ){
      return '0$count';
    }
    return count.toString();
  }
}
