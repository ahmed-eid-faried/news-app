import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:news/core/constant/color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';

class MyService extends GetxService {
  late SharedPreferences pref;
  Future<MyService> init() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    handlingErrors();
    pref = await SharedPreferences.getInstance();
    await GetStorage.init();

    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    return this;
  }
}

initService() async {
  await Get.putAsync(() => MyService().init());
}

handlingErrors() {
  RenderErrorBox.backgroundColor = AppColor.primaryColor;
  // ErrorWidget.builder = (FlutterErrorDetails details) => Container();
}
