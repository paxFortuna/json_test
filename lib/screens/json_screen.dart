import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../repository/repository.dart';

class JsonScreen extends StatefulWidget {
  const JsonScreen({Key? key}) : super(key: key);

  @override
  State<JsonScreen> createState() => _JsonScreenState();
}

class _JsonScreenState extends State<JsonScreen> {
  Map<String, dynamic> mapFromJson = {};

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

    // mapFromJson = await loadJson();
    await loadJson();
    update();

    isLoading = false;
    update();
  }

  Future<Map<String, dynamic>>loadJson() async {
    // 빙법1
    String data = await rootBundle.loadString('assets/json/hits.json');
    mapFromJson = jsonDecode(data);
    return mapFromJson;
    print(mapFromJson);
  }

  @override
  Widget build(BuildContext context) {
    hits = mapFromJson['hits'];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Search',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: hits.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemBuilder: (BuildContext context, int index) {

                  Map<String, dynamic> photo = hits[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        photo['previewURL'],
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
