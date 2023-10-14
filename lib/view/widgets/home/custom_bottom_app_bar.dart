
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/home_controller.dart';
import 'package:news/view/widgets/home/custom_button_app_bar.dart';
  
class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(controller.homePages.length, (index) {
              return CustomButtonAppBar(
                homePage: controller.homePages[index],
                index: index,
              );
            }),
          ],
        ),
      ),
    );
  }
}
