import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/webviewer.dart';
 import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatelessWidget {
  const MyWebView({super.key});

  @override
  Widget build(BuildContext context) {
    MyWebViewerPageControllerImp controller =
        Get.put(MyWebViewerPageControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text('${controller.title} '),
         actions: [
          IconButton(
              onPressed: () {
                controller.goToNews(controller.urlForWeb);
              },
              icon: const Icon(Icons.chrome_reader_mode_outlined))
        ],
      ),
      body: WebViewWidget(controller: controller.webController),
    );
  }
}
 