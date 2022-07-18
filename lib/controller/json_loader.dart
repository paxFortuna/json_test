import 'package:get/get.dart';

import '../models/photos.dart';

class JsonLoader extends GetxController {
  static JsonLoader get to => Get.find();
  var photos = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

}