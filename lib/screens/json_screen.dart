import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/photos.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({Key? key}) : super(key: key);

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  List<Photos> images = [];

  Future<List<Photos>> getImages() async {
    await Future.delayed(const Duration(seconds: 1));

    String jsonString = await rootBundle.loadString('assets/json/hits.json');

    Map<String, dynamic> json = jsonDecode(jsonString);

    Iterable hits = json['hits'];

    List<Photos> results = hits.map((e) => Photos.fromJson(e)).toList();

    return results;

    // return hits.map((e) => Photos.fromJson(e)).toList();
  }

  update() => setState(() {});

  Future initData() async {
    images = await getImages();
    update();
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'Photos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 3),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Expanded(
              child: images.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      itemCount: images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1.2,
                        mainAxisSpacing: 0.5,
                        crossAxisSpacing: 0.5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        Photos image = images[index] as Photos;

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              image.previewURL,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
