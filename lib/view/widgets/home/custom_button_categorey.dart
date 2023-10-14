import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/myhomecontroller.dart';
import 'package:news/core/constant/color.dart';
import 'package:news/data/datasource/static/static.dart';

class CustomButtonCategorey extends StatelessWidget {
  const CustomButtonCategorey({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    MyHomePageControllerImp controller = Get.put(MyHomePageControllerImp());

    return InkWell(
      onTap: () {
        controller.changeCategory(index, null);
      },
      child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: MyHomePageControllerImp.isSelectedCategory ==
                      category[index].toString()
                  ? AppColor.primaryColor
                  : const Color.fromARGB(255, 238, 234, 234),
              borderRadius: BorderRadius.circular(50)),
          child: Text(
            ' ${category[index]}'.toUpperCase(),
            style: TextStyle(
                color: MyHomePageControllerImp.isSelectedCategory ==
                        category[index].toString()
                    ? Colors.white
                    : Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
