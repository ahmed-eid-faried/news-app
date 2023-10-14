import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news/data/model/articles.dart';
import 'package:news/view/screens/homescreen.dart';

class CustomCardHomeController extends GetxController {
  final box = GetStorage();
  final Articles article;
  CustomCardHomeController(this.article) {
    listBookMarker = [];
    listBookMarkerArticles = [];
  }

  late List listBookMarker;
  late List<Articles> listBookMarkerArticles;

  initialData() {
    listBookMarker = (box.read<List<dynamic>>('listBookMarker')) ?? [];
    listBookMarkerArticles = [];

    for (var element in listBookMarker) {
      final bookMarkerData = box.read<Map<String, dynamic>>(element);
      if (bookMarkerData != null) {
        listBookMarkerArticles.add(Articles.fromJson(bookMarkerData));
      } else {
        print("Warning: Found invalid or null data for key: $element");
      }
    }
  }

  List removeDuplicates(List inputList) {
    Set uniqueSet = Set.from(inputList);
    List resultList = uniqueSet.toList();
    return resultList;
  }

  bool bookmarkerReadState(Articles article) {
    if (article.title != null) {
      final key = article.title!.trim();
      bool state = listBookMarker.contains(key);
      print("============================================");
      print(key);
      print(state);
      print("============================================");
      return state;
    } else {
      return false;
    }
  }

  Future<void> bookmarkerSaveFun(Articles article) async {
    if (article.title != null) {
      final key = article.title!.trim();
      print(key);
      await box.write(key, article.toJson());
      listBookMarker.add(key);
      listBookMarker = removeDuplicates(listBookMarker);
      await box.write("listBookMarker", listBookMarker);
    }
  }

  Future<void> bookmarkerRemoveFun(Articles article) async {
    await box.remove(article.title!.trim());
    listBookMarker = (box.read<List<dynamic>>('listBookMarker')) ?? [];
    listBookMarker.removeWhere((element) => element == article.title!.trim());
    await box.write("listBookMarker", listBookMarker);
    Get.offAll(const HomeScreen());
    update();
  }

  bool bookmarker(Articles articl) {
    bool isBookmarked = bookmarkerReadState(article);
    print(isBookmarked);
    return isBookmarked;
  }

  @override
  void onInit() async {
    await initialData();
    super.onInit();
  }
}
