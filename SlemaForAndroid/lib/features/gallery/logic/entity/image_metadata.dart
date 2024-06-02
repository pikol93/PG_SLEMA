import 'dart:convert';

/// Immutable data type used to store information about an image
class ImageMetadata {
  final String id;

  ImageMetadata({
    required this.id,
  });

  static ImageMetadata fromJson(String value) {
    return _fromJsonObject(jsonDecode(value));
  }

  String toJson() {
    return jsonEncode(_toJsonObject());
  }

  Map<String, String> _toJsonObject() {
    return {
      "id": id,
    };
  }

  static ImageMetadata _fromJsonObject(Map<String, String> map) {
    return ImageMetadata(
      id: map["id"]!,
    );
  }
}
