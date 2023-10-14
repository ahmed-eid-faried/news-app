import 'package:get/get.dart';
import 'package:news/core/constant/routes.dart';
import 'package:news/view/screens/book_mark.dart';
import 'package:news/view/screens/categories.dart';
import 'package:news/view/screens/home.dart';
import 'package:news/view/screens/homescreen.dart';
import 'package:news/view/screens/mywebview.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.myhomepage, page: () => const MyHomePage()),
  GetPage(name: AppRoute.mywebview, page: () => const MyWebView()),
  GetPage(name: AppRoute.categories, page: () => const Categories()),
  GetPage(name: AppRoute.bookmark, page: () => const BookMark()),
];
