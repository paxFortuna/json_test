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

    mapFromJson= await loadJson();
    update();

    isLoading = false;
    update();
  }

  loadJson() async {
    // 빙법1
    String data = await rootBundle.loadString('assets/json/hits.json');
    mapFromJson = jsonDecode(data);
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
                itemCount: hits.length, //item 개수
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                  childAspectRatio: 1, //item 의 가로 1, 세로 2 의 비율
                ),
                itemBuilder: (BuildContext context, int index) {

                  Map<String, dynamic> image = hits[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        image['previewURL'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }, //item 의 반목문 항목 형성
              ),),
          ],
        ),
      ),
    );
  }
}
