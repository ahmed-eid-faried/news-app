import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news/controller/contact_us_controller.dart';
import 'package:news/core/class/handling_data_view.dart';
import 'package:news/core/constant/color.dart';
import 'package:news/view/widgets/custom_card.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ContactUsController());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.backgroundcolor,
          title: const Text("Contact Us")),
      body: GetBuilder<ContactUsController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListTile(
                    leading: const Icon(
                        color: AppColor.secondColor, Icons.chat_outlined),
                    title: const Text("whatsapp",
                        style: TextStyle(color: AppColor.secondColor)),
                    onTap: () {
                      controller.whatsapp();
                    },
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(color: AppColor.secondColor)),
                  ListTile(
                    leading: const Icon(
                        color: AppColor.secondColor, Icons.email_outlined),
                    title: const Text("Send Email",
                        style: TextStyle(color: AppColor.secondColor)),
                    onTap: () {
                      controller.launchMail();
                    },
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(color: AppColor.secondColor)),
                  ListTile(
                    leading: const Icon(
                        color: AppColor.secondColor, Icons.sms_outlined),
                    title: const Text("Send SMS",
                        style: TextStyle(color: AppColor.secondColor)),
                    onTap: () {
                      controller.launchSMS();
                    },
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(color: AppColor.secondColor)),
                  ListTile(
                    leading: const Icon(
                        color: AppColor.secondColor,
                        Icons.phone_android_outlined),
                    title: const Text("Call Us",
                        style: TextStyle(color: AppColor.secondColor)),
                    onTap: () {
                      controller.launchTel();
                    },
                  ),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(color: AppColor.secondColor)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Sources",
                        style: TextStyle(
                            color: AppColor.secondColor, fontSize: 24),
                        textAlign: TextAlign.center),
                  ),
                  Container(
                    height: 290.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.secondColor)),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: [
                        ...List.generate(
                            controller.sources.length,
                            (index) => CustomCard(
                                index: index, controller: controller))
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
