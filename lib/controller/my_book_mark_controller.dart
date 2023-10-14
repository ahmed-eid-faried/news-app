

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news/core/class/status_request.dart';
import 'package:news/data/model/articles.dart';

class MyBookMarkControllerImp extends GetxController {
  StatusRequest statusRequest = StatusRequest.noAction;
  final box = GetStorage();

  late List listBookMarker;
  late List<Articles> listBookMarkerArticles;

  void initialData() {
    listBookMarker = box.read<List>('listBookMarker') ?? [];
    listBookMarkerArticles = [];

    for (var element in listBookMarker) {
      final bookMarkerData = box.read<Map<String, dynamic>>(element);
      if (bookMarkerData != null) {
        listBookMarkerArticles.add(Articles.fromJson(bookMarkerData));
      } else {
        print("Warning: Found null data for key: $element");
      }
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
