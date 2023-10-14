import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/myhomecontroller.dart';
import 'package:news/data/datasource/static/static.dart';
import 'package:news/view/widgets/home/custom_button_categorey.dart';
import 'package:news/view/widgets/home/custom_card_home.dart';

class CustomBodyOfHome extends StatelessWidget {
  const CustomBodyOfHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // MyHomePageControllerImp controller =
    Get.put(MyHomePageControllerImp());
    return ListView(children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        child: Text(
          'Browse',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        child: Text(
          'Discover things of this world',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      GetBuilder<MyHomePageControllerImp>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
          child: TextFormField(
            controller: controller.searchController,
            decoration: InputDecoration(
              suffixIcon: DropdownButton<String>(
                value: controller.selectedCountryCode,
                onChanged: (value) async {
                  await controller.changeCountry(value);
                },
                items: countryCodes
                    .map<DropdownMenuItem<String>>((String countryCode) {
                  return DropdownMenuItem<String>(
                    value: countryCode,
                    child: Text(countryCode),
                  );
                }).toList(),
              ),
              prefixIcon: IconButton(
                  onPressed: () {
                    controller.search(controller.searchController!.text);
                  },
                  icon: const Icon(Icons.search)),
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
            ),
          ),
        ),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          ...List.generate(
              category.length, (index) => CustomButtonCategorey(index: index))
        ]),
      ),
      // MyHomePageControllerImp controller = Get.put(MyHomePageControllerImp());
      GetBuilder<MyHomePageControllerImp>(
        builder: (controller) => ListView.builder(
            itemCount: controller.articles.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return CustomCardHome(
                article: article,
                saveButtom: true,
              );
            }),
      ),
    ]);
  }
}
