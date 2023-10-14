import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/home_controller.dart';
import 'package:news/core/function/alertexitapp.dart';
import 'package:news/view/widgets/home/custom_bottom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => WillPopScope(
              onWillPop: alertExitApp,
              child: Scaffold(
                  bottomNavigationBar: const CustomBottomAppBar(),
                  body: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                        child: controller
                            .homePages[HomeControllerImp.currentpage].page),
                  )),
            ));
  }
}
