import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/core/class/handling_data_view.dart';
import 'package:news/core/constant/color.dart';
import 'package:news/controller/my_book_mark_controller.dart';
import 'package:news/view/widgets/home/custom_card_home.dart';

class BookMark extends StatelessWidget {
  const BookMark({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyBookMarkControllerImp());
    return GetBuilder<MyBookMarkControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        child: SafeArea(
          child: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.center,
                  colors: AppColor.gradient,
                ),
              ),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    child: Text(
                      'BookMark',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    child: Text(
                      'Thousands of articles in each category',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ...List.generate(
                    controller.listBookMarkerArticles.length,
                    (index) {
                      final article = controller.listBookMarkerArticles[index];
                      return CustomCardHome(
                        article: article,
                        removeButtom: true,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
