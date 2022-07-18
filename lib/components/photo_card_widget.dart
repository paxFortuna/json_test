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
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: Colors.white60,
          ),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Icon(Icons.search),
              hintText: '검색',
            ),
          ),
        ),
        Card(
          child: Container(
            constraints: BoxConstraints(minHeight: minHeight),
            padding: const EdgeInsets.all(8),
            child: Expanded(
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
          ),
        ),
      ],
    );
  }

  double getMinHeight(int index) {
    switch (index % 4) {
      case 0:
        return 100;
      case 1:
        return 120;
      case 2:
        return 130;
      case 3:
        return 100;
      default:
        return 100;
    }
  }
}
