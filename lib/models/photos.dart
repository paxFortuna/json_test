import 'package:flutter/material.dart';

class Photos {
  int total;
  int totalHits;
  Hits hits;

  Photos({
    required this.total,
    required this.totalHits,
    required this.hits,
  });

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalHits": totalHits,
        "Hits": hits.toJson(),
      };

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        total: json["total"] as int,
        totalHits: json["totalHits"] as int,
        hits: Hits.fromJson(json["hits"]),
      );
}

class Hits {
  int id;
  String previewUrl;
  int downloads;

  Hits({
    required this.id,
    required this.previewUrl,
    required this.downloads,
  });

  factory Hits.fromJson(Map<String, dynamic> json) => Hits(
      id: json["id"] as int,
      previewUrl: json["previewUrl"] as String,
      downloads: json["downloads"] as int,
  );

  Map<String, dynamic> toJson() => {
        "id": id,
        "previewUrl": previewUrl,
        "downloads": downloads,
      };
}
