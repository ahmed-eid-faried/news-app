import 'dart:io';
import 'package:get/get.dart';
import 'package:news/core/class/status_request.dart';
import 'package:news/core/function/handling_data.dart';
import 'package:news/data/datasource/remote/news.dart';
import 'package:news/data/model/sources.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsController extends GetxController {
  String settingstel = '+201555663045';
  String settingssms = '+201555663045';
  String settingsemail = 'ahmed.eid.ac.1.edu@gmail.com';
 
  whatsapp() async {
    var contact = "+201555663045";
    var androidUrl = "whatsapp://send?phone=$contact&text=Here Message";
    var iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('text=Here Message')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      print('WhatsApp is not installed.');
    }
  }

  launchTel() async {
    final Uri telUri = Uri(scheme: 'tel', path: settingstel);
    await launchUrl(telUri);
    update();
  }

  launchMail() {
    String url = 'mailto:$settingsemail?subject=News App&body=';
    final Uri emailLaunchUri = Uri.parse(url);

    launchUrl(emailLaunchUri);
  }

  launchSMS() async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: settingssms,
      queryParameters: {'body': "here message"}, // Updated variable name
    );
    await launchUrl(smsUri);
    update();
  }

/////////////////////////////////////////////////////////////////////////
  NewsData newsData = NewsData(Get.find());
  late StatusRequest statusRequest;
  late Sources data;
  List<Source> sources = [];
  initialData() async {
    statusRequest = StatusRequest.loading;
    update();
    await getDataSources();
    update();
  }

  getDataSources() async {
    try {
      var response = await newsData.getDataSources();
      if (response != null) {
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          data = Sources.fromJson(response);
          if (data.status == 'ok') {
            sources = data.sources ?? [];
          }
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
      return statusRequest;
    } catch (e) {
      return StatusRequest.failure;
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

 
 
  Future<void> linkToSources(String? url) async {
    if (url != null) {
      final Uri url0 = Uri.parse(url);
      if (!await launchUrl(url0)) {
        throw Exception('Could not launch $url0');
      }
    }
  }

 
}
