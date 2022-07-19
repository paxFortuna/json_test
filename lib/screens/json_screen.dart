import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../components/photo_card_widget.dart';
import '../repository/repository.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({Key? key}) : super(key: key);

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {

  Map<String, dynamic> photos = {};
  List<Map<String, dynamic>> hits = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  void update() => setState(() {});

  void initData() async {
    isLoading = true;
    update();

    await loadJson();
    update();

    isLoading = false;
    update();
  }


  Widget buildPhotos() => StaggeredGridView.countBuilder(
      padding: const EdgeInsets.all(8),
      // physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: photos.length,
      staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {

        hits = photos['hits'];
        Map<String, dynamic> image = hits[index];

        return PhotoCardWidget(
            index: index,
            data: photos[index],
            // id: image['id'],
            // downloads: image["downloads"],
            // imageUrl: image["imageUrl"],
            // totalHist: photos["totalHits"][index],
        );
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
              : buildPhotos(),
    );
  }
}
