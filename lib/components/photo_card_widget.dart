import 'package:flutter/material.dart';
import 'package:json_exam/models/photos.dart';

class PhotoCardWidget extends StatelessWidget {
  const PhotoCardWidget({
    Key? key,
    required this.id,
    required this.downloads,
    required this.imageUrl,
    required this.totalHist,
    required this.index,
  }) : super(key: key);

  final int id;
  final int downloads;
  final String imageUrl;
  final int totalHist;
  final int index;

  @override
  Widget build(BuildContext context) {
    final minHeight = getMinHeight(index);
    return Card(
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: id,
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),
            const Spacer(),
            Text(totalHist.toString()),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  downloads.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  downloads.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 150;
      case 2:
        return 150;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
