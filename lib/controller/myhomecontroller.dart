import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/core/class/status_request.dart';
import 'package:news/core/function/get_des_of_position.dart';
import 'package:news/core/function/handling_data.dart';
import 'package:news/core/services/services.dart';
import 'package:news/data/datasource/remote/news.dart';
import 'package:news/data/datasource/static/static.dart';
import 'package:news/data/model/articles.dart';
import 'package:news/data/model/newsapimodel.dart';
import 'package:geocoding/geocoding.dart';

abstract class MyHomePageController extends GetxController {
  getDataCurrentNews(String country, String isSelectedCategory);
  initialData();
  getDataSearchNews(String search);
  changeCategory(int index, String? countrySaveK);
  search(String search);
  changeCountry(String? value);
  currentLocations();
}

class MyHomePageControllerImp extends MyHomePageController {
  NewsData newsData = NewsData(Get.find());
  late StatusRequest statusRequest;
  MyService myServices = Get.find();
  NewsApiModel? data;
  int totalResults = 0;
  List<Articles> articles = [];
  static String isSelectedCategory = 'general';
  TextEditingController? searchController;
  String urlForWeb = 'https://flutter.dev';
  bool bookmarkerState = false;
  String selectedCountryCode = '';

  @override
  changeCountry(String? value) async {
    statusRequest = StatusRequest.loading;
    selectedCountryCode = value!;
    await getDataCurrentNews(selectedCountryCode, isSelectedCategory);
    // await  changeCategory( 0,  selectedCountryCode) ;
    update();
  }

  @override
  getDataCurrentNews(String country, String isSelectedCategory) async {
    try {
      var response = await newsData.getDataTopHeadlines(country,
          categorya: isSelectedCategory);
      if (response != null) {
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          data = NewsApiModel.fromJson(response);
          if (data!.status == 'ok') {
            totalResults = data!.totalResults ?? 0;
            articles = data!.articles ?? [];
          }
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
      return statusRequest;
    } catch (e) {
      return StatusRequest.failure;
    }
  }

  @override
  currentLocations() async {
    var countrySave = myServices.pref.getString('country');
    if (countrySave == null || countrySave == '') {
      LocationMap locationMap = LocationMap();
      await locationMap.check(null);
      Placemark? position = await locationMap.getDesOfCurrentPosition();
      // ignore: unnecessary_null_comparison
      if (position != null) {
        selectedCountryCode = position.isoCountryCode ?? 'us';
        selectedCountryCode = selectedCountryCode.toLowerCase();
        print(0);

        if (countryCodes.any((element) => element == selectedCountryCode)) {
          selectedCountryCode = selectedCountryCode;
          print(1);
        } else {
          selectedCountryCode = 'us';
          print(2);
        }
        myServices.pref.setString('country', selectedCountryCode);
      } else {
        print(3);
        selectedCountryCode = 'us';
      }
    } else {
      selectedCountryCode = countrySave;
    }
  }

  @override
  initialData() async {
    searchController = TextEditingController();
    statusRequest = StatusRequest.loading;
    update();
    await currentLocations();
    await getDataCurrentNews(selectedCountryCode, isSelectedCategory);
    update();
  }

  @override
  getDataSearchNews(String search) async {
    try {
      var response = await newsData.getDataSearchEverything(search);
      //  getDataTopHeadlines(selectedCountryCode,
      // categorya: isSelectedCategory, searcha: search);
      if (response != null) {
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          data = NewsApiModel.fromJson(response);
          if (data!.status == 'ok') {
            totalResults = data!.totalResults ?? 0;
            articles = data!.articles ?? [];
          }
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
      return statusRequest;
    } catch (e) {
      print(e);
      return StatusRequest.failure;
    }
  }

  @override
  changeCategory(int index, String? countrySaveK) async {
    if (isSelectedCategory != category[index]) {
      statusRequest = StatusRequest.loading;
      update();
      isSelectedCategory = category[index];
      String? countrySave;
      if (countrySaveK == null) {
        countrySave = (selectedCountryCode == '')
            ? myServices.pref.getString('country')
            : selectedCountryCode;
      } else {
        countrySave = countrySaveK;
      }
      await getDataCurrentNews(countrySave!, isSelectedCategory);
      update();
    }
  }

  @override
  search(String search) async {
    // ignore: unnecessary_null_comparison
    if (search != '' || search != null) {
      statusRequest = StatusRequest.loading;
      update();
      await getDataSearchNews(search);
      isSelectedCategory = '';
      update();
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
