import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../components/photo_card_widget.dart';
import '../models/photos.dart';

class JsonScreen extends StatefulWidget {
  JsonScreen({Key? key}) : super(key: key);

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  List<Map<String, dynamic>> photos = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void update() => setState(() {});

  Future initData() async {
    setState(() {
      isLoading = true;
    });
    photos = await _getPhotos();
    update();
    setState(() {
      isLoading = false;
    });
  }

  Future<List<Map<String, dynamic>>> _getPhotos() async {
    if (context != null) {
      String datas = await DefaultAssetBundle.of(context)
          .loadString("assets/json/hits.json");
      List<Map<String, dynamic>> results =
          ((jsonDecode(datas) as List).cast<Map<String, dynamic>>().toList());
      return results;
    } else {
      return Future.delayed(const Duration(milliseconds: 1000), _getPhotos);
    }
  }

  Widget buildNotes() => StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(8),
      // physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: photos.length,
      staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        Map<String, dynamic> photo = photos[index] as Map<String, dynamic>;

        return PhotoCardWidget(
            id: photo["hits"][index]["id"],
            downloads: photo["hits"][index]["downloads"],
            imageUrl: photo["hits"][index]["imageUrl"],
            totalHist: photo["totalHits"][index],
            index: index);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'JsonPhotos',
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: (isLoading == true)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : (isLoading == false && photos.isEmpty)
              ? const Center(child: Text('No Data'))
              : buildNotes(),
    );
  }
}
