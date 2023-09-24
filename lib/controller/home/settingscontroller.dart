import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/core/shared/defaultdialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class SettingsController extends GetxController {
  logout();
  goToAddress();
  goToOrders();
  goToArchive();
  contactUs();
}

class SettingsControllerImp extends SettingsController {
  MyServices myServices = Get.find();
  List listData = [
    {
      "title": "Archive",
      "trailling": const Icon(Icons.archive),
    },
    {
      "title": "Adress",
      "trailling": const Icon(Icons.location_on),
    },
    {
      "title": "About Us",
      "trailling": const Icon(Icons.info_outlined),
    },
    {
      "title": "Contact Us",
      "trailling": const Icon(Icons.phone_callback),
    },
    {
      "title": "Log out",
      "trailling": InkWell(
        child: Icon(Icons.exit_to_app),
        onTap: () {},
      ),
    },
  ];

  @override
  logout() {
    defultDialog("Waringing", "Are You Sure That You Want to Log Out", "Cancel", "Confirm", 20, 20, () {
      Get.back();
    }, () {
      myServices.sharedPrefs!.setString('step', '1');
      String id = "${myServices.sharedPrefs!.getString("id")}";
      FirebaseMessaging.instance.unsubscribeFromTopic("admin");
      FirebaseMessaging.instance.unsubscribeFromTopic("admin$id");
      Get.offAllNamed(Approutes.login);
    });
  }

  @override
  goToAddress() {
    Get.toNamed(Approutes.address);
  }

  @override
  goToOrders() {
    Get.toNamed(Approutes.pendings);
  }

  @override
  goToArchive() {
    Get.toNamed(Approutes.archive);
  }

  @override
  contactUs() {
    launchUrl(Uri.parse("mailto:Keeplearning913@gmail.com?subject=News&body=New%20plugin"));
  }
}
