import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/data/model/home_pages_model.dart';
import 'package:news/view/screens/book_mark.dart';
import 'package:news/view/screens/categories.dart';
import 'package:news/view/screens/contactus.dart';
import 'package:news/view/screens/home.dart';
import 'package:news/view/screens/homescreen.dart';

abstract class HomeController extends GetxController {
  changePage(int index);
}

class HomeControllerImp extends HomeController {
  static int currentpage = 0;
  List<HomePagesModel> homePages = [
    HomePagesModel(
        title: "Home", icon: Icons.home_outlined, page: const MyHomePage()),
    HomePagesModel(
        title: "Categories",
        icon: Icons.category_outlined,
        page: const Categories()),
    HomePagesModel(
        title: "BookMark",
        icon: Icons.bookmark_outline_outlined,
        page: const BookMark()),
    HomePagesModel(
        title: "ContactUs", icon: Icons.info_outline, page: const ContactUs()),
  ];
  @override
  changePage(int index) {
    Get.offAll(const HomeScreen());
    currentpage = index;
    update();
  }
}
