

import 'dart:convert';

import 'package:flutter/services.dart';

Map<String, dynamic> photos = {};
loadJson() async {
  // 빙법1
  String data = await rootBundle.loadString('assets/json/hits.json');
  photos = jsonDecode(data);
  print(photos);

  //방법 2
  // Map<String, dynamic> photos = await rootBundle
  //     .loadStructuredData('assets/json/hits.json', (String s) async {
  //   return json.decode(s);
  // });
// Future<Map<String, dynamic>> _getPhotos() async {
//   if (context != null) {
//     String datas = await DefaultAssetBundle.of(context).loadString(
//         "assets/json/hits.json");
//     List<Map<String, dynamic>> results = ((json.decode(datas) as List)
//         .cast<Map<String, dynamic>>().toList());
//     return results;
//    } else {
//      return Future.delayed(const Duration(milliseconds: 1000), _getPhotos);
//    }
// }
}