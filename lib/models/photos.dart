class Photos {
  final int id;
  final String tags;
  final String previewURL;
  final int downloads;

  Photos({
    required this.id,
    required this.tags,
    required this.previewURL,
    required this.downloads,
  });

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
    id: json['id'] as int,
    tags: json['tags'] as String,
    previewURL: json['previewURL'] as String,
    downloads: json['downloads'] as int,
  );
}
