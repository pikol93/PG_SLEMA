import 'dart:convert';

class StoredImageMetadata {
  final String id;
  final String filename;

  StoredImageMetadata({
    required this.id,
    required this.filename,
  });

  static StoredImageMetadata fromJson(String value) {
    return _fromJsonObject(jsonDecode(value));
  }

  String toJson() {
    return jsonEncode(_toJsonObject());
  }

  Map<String, String> _toJsonObject() {
    return {
      "id": id,
      "filename": filename,
    };
  }

  static StoredImageMetadata _fromJsonObject(Map<String, dynamic> map) {
    return StoredImageMetadata(
      id: map["id"]!,
      filename: map["filename"]!,
    );
  }

  @override
  String toString() {
    return toJson();
  }
}
