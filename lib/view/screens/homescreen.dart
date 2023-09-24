import 'package:admin_ecommerce/core/constants/imageassets.dart';
import 'package:admin_ecommerce/view/widgets/homewidgets/customgridfcardhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home/homescreencontroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: ListView(
            children: [
              GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 5, childAspectRatio: .9),
                  children: [
                    CustomGridCardHome(
                        onCardTap: () {
                          controller.goToViewCats();
                        },
                        text: "Categories",
                        url: Appimageassets.cats),
                    CustomGridCardHome(
                        onCardTap: () {
                          controller.goToViewItems();
                        },
                        text: "Products",
                        url: Appimageassets.items),
                    CustomGridCardHome(
                        onCardTap: () {
                          controller.goToOrdersScreen();
                        },
                        text: "Orders",
                        url: Appimageassets.order),
                    CustomGridCardHome(onCardTap: () {}, text: "Users", url: Appimageassets.users),
                    CustomGridCardHome(
                      onCardTap: () {},
                      text: "Reports",
                      url: Appimageassets.report,
                    ),
                    CustomGridCardHome(onCardTap: () {}, text: "Delivery", url: Appimageassets.delivery2),
                    CustomGridCardHome(
                        onCardTap: () {
                          controller.gotonotifications();
                        },
                        text: "Notifications",
                        url: Appimageassets.notificationimage),
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
