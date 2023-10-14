import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news/core/constant/color.dart';
import 'package:news/data/model/articles.dart';
import 'package:news/view/screens/mywebview.dart';
import 'package:news/view/widgets/home/custom_card_home_controller.dart';

class CustomCardHome extends StatelessWidget {
  final Articles article;
  final bool saveButtom;
  final bool removeButtom;

  const CustomCardHome(
      {Key? key,
      required this.article,
      this.saveButtom = false,
      this.removeButtom = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CustomCardHomeController(article));
    return GetBuilder<CustomCardHomeController>(
      builder: (controllerCard) {
        return InkWell(
          onTap: () {
            Get.to(const MyWebView(), arguments: {
              "title": article.title,
              "url": article.url,
              "urlToImage": article.urlToImage ?? ""
            });
          },
          child: Card(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                image: article.urlToImage == null
                    ? null
                    : DecorationImage(
                        image: CachedNetworkImageProvider(article.urlToImage!),
                        fit: BoxFit.cover,
                        opacity: 0.5),
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: const Alignment(0.20, -0.98),
                  end: const Alignment(-0.2, 0.98),
                  colors: [
                    AppColor.gradientdeepblue1,
                    AppColor.gradientdeepblue2,
                  ],
                ),
              ),
              child: ListTile(
                title: Text(
                  article.title!,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Row(
                  children: [
                    if (saveButtom)
                      IconButton(
                          onPressed: () async {
                            await controllerCard.bookmarkerSaveFun(article);
                          },
                          icon: const Icon(
                            Icons.save_alt_outlined,
                            color: Colors.white,
                          )),
                    if (removeButtom)
                      IconButton(
                          onPressed: () async {
                            await controllerCard.bookmarkerRemoveFun(article);
                          },
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Colors.white,
                          )),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '  ${DateFormat('MMMM d', 'en_US').format(DateTime.parse(article.publishedAt!))}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
