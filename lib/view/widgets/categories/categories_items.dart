
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/my_categories_controller.dart';
import 'package:news/core/constant/color.dart';
import 'package:news/data/datasource/static/static.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyCategoriesControllerImp controller = Get.put(MyCategoriesControllerImp());

    return Wrap(
      children: [
        ...List.generate(
            category.length,
            (index) => InkWell(
                  onTap: () {
                    controller.categories(category[index]);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          categoryIcons[index],
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(category[index],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ))
      ],
    );
  }
}
