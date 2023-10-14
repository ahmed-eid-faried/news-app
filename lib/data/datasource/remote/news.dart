import 'package:news/core/class/curd.dart';
import 'package:news/core/constant/applink.dart';

class NewsData {
  Curd curd;
  NewsData(this.curd);

  getDataTopHeadlines(String country,
      {String categorya = '', String searcha = ""}) async {
    String category = categorya == '' ? '' : "&category=$categorya";
    String search = searcha == '' ? '' : "&q=$searcha";
    String topHeadlinesapi =
        "${AppLink.topHeadlinesApi}$country$category$search${AppLink.appid}";
    print("topHeadlinesapi:- $topHeadlinesapi");
    var response = await curd.getData(topHeadlinesapi);
    return response.fold((l) => l, (r) => r);
  }

  getDataSearchEverything(String search) async {
    String searchEverything = "${AppLink.everythingApi}$search${AppLink.appid}";
    print("searchEverything:- $searchEverything");
    var response = await curd.getData(searchEverything);
    return response.fold((l) => l, (r) => r);
  }

  getDataSources() async {
    var response = await curd.getData(AppLink.sources);
    return response.fold((l) => l, (r) => r);
  }
}
