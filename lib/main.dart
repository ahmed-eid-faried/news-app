import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/core/binding/bindings.dart';
import 'package:news/core/constant/apptheme.dart';
import 'package:news/core/services/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:news/routes.dart';

void main() async {
  await initService();
  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News',
          theme: AppThemes.stdTheme,
          initialBinding: MyBindings(),
          initialRoute: "/home",
          getPages: routes,
        );
      },
    );
  }
}
