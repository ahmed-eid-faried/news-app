import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/myhomecontroller.dart';
import 'package:news/core/class/handling_data_view.dart';
import 'package:news/core/constant/color.dart';
import 'package:news/view/widgets/home/custom_body_of_home.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyHomePageControllerImp());
    return Scaffold(
      body: GetBuilder<MyHomePageControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          child: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  // image: const DecorationImage(
                  //     opacity: 0.7,
                  //     image: AssetImage('assets/images/1.png'),
                  //     fit: BoxFit.cover),
                  gradient: SweepGradient(
                    colors: AppColor.gradient,
                  ),
                ),
                child: const CustomBodyOfHome()),
          ),
        ),
      ),
    );
  }
}
