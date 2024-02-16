class Picture {
  static const String pictureListSharedPrefKey = 'pictures';
  final String id;
  final String url;
  final String name;
  final String extension;
  final int byteSize;

  Picture(this.id, this.url, this.name, this.extension, this.byteSize);

  @override
  String toString() {
    return 'Picture{'
        'id: $id,'
        ' name: $name,'
        ' url: $url,'
        ' extenstion: $extension,'
        ' byteSize: $byteSize}';
  }
}
