
import 'package:flutter/material.dart';
import 'package:news/controller/contact_us_controller.dart';
import 'package:news/core/constant/color.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.index,
    required this.controller,
  });
  final int index;
  final ContactUsController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: ListTile(
        onTap: () {
          controller.linkToSources("${controller.sources[index].url}");
        },
        title: Text(controller.sources[index].id.toString(),
            style: const TextStyle(color: AppColor.secondColor),
            textAlign: TextAlign.center),
        subtitle: Text(controller.sources[index].description.toString(),
            textAlign: TextAlign.center),
      ),
    );
  }
}
