// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/core/class/status_request.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

abstract class MyWebViewerPageController extends GetxController {
  initialData();
  goToNews(String? url);
}

class MyWebViewerPageControllerImp extends MyWebViewerPageController {
  String urlForWeb = 'https://flutter.dev';
  String title = 'title';
  late WebViewController webController;
  StatusRequest statusRequest = StatusRequest.noAction;
  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    update();
    title = Get.arguments['title'];
    urlForWeb = Get.arguments['url'];
    print("title:- $title");
    print("urlForWeb:- $urlForWeb");

    webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(urlForWeb));
    statusRequest = StatusRequest.success;
  }

  @override
  Future<void> goToNews(String? url) async {
    if (url != null) {
      final Uri url0 = Uri.parse(url);
      if (!await launchUrl(url0)) {
        throw Exception('Could not launch $url0');
      }
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
