import 'package:flutter/material.dart';
import 'package:json_exam/models/photos.dart';

class PhotoCardWidget extends StatefulWidget {
  PhotoCardWidget({
    Key? key,
    required this.data,
    required this.index,
    // required this.id,
    // required this.downloads,
    // required this.imageUrl,
    // required this.totalHist,
  }) : super(key: key);

  final Photos data;
  final int index;
  // final int id;
  // final int downloads;
  // final String imageUrl;
  // final int totalHist;


  @override
  State<PhotoCardWidget> createState() => _PhotoCardWidgetState();
}

class _PhotoCardWidgetState extends State<PhotoCardWidget> {
  Widget _genTextFields() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white60,
      ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: const Icon(Icons.search),
          hintText: '검색',
        ),
      ),
    );
  }

  Widget _cardWidget() {
    // final minHeight = getMinHeight(widget.index);
    return Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.data.id,
                child: Image.network(widget.data.previewURL, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Text(widget.data.tags),
              const SizedBox(height: 5),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.data.downloads.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.data.id.toString(),
            style: const TextStyle(fontSize: 20),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _genTextFields(),
            const SizedBox(height: 10),
            _cardWidget(),
          ],
        ));
  }
  //
  // double getMinHeight(int index) {
  //   switch (index % 4) {
  //     case 0:
  //       return 100;
  //     case 1:
  //       return 120;
  //     case 2:
  //       return 130;
  //     case 3:
  //       return 100;
  //     default:
  //       return 100;
  //   }
  // }
}
