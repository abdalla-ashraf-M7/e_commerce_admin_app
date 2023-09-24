import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/approutes.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPrefs!.getString("step") == "2") {
      return const RouteSettings(name: Approutes.homescreen);
    }
    if (myServices.sharedPrefs!.getString("step") == "1") {
      return const RouteSettings(name: Approutes.login);
    }
  }
}
