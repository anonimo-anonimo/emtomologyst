abstract class ModelEntity {
  const ModelEntity();

  Map<String, dynamic> toJson();
  ModelEntity copyWith();
  ModelEntity fromJson(Map<String, dynamic> json);
  ModelEntity fromString(String jsonStringify);
  @override
  String toString();
}
