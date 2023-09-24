import 'dart:io';
import 'package:admin_ecommerce/controller/cats/viewcatscontroller.dart';
import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/data/datasourse/remote/catsdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../core/services/services.dart';

abstract class AddCatController extends GetxController {
  addCat();
  goToAddCats();
  initalData();
  chooseImage();
  getCurrentTime();
}

class AddCatControllerImp extends AddCatController {
  CatsData catsData = CatsData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.none;
  TextEditingController? name;
  TextEditingController? nameAr;
  File? file;
  GlobalKey<FormState> addCatsKey = GlobalKey<FormState>();

  @override
  initalData() {
    name = TextEditingController();
    nameAr = TextEditingController();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  late Map dataSent = {
    "name": name!.text,
    "namear": nameAr!.text,
    "time": getCurrentTime(),
  };

  @override
  addCat() async {
    if (addCatsKey.currentState!.validate()) {
      if (file == null) return Get.snackbar("Warning", "you Should Choose image");
      requeststate = requeststatus.loading;
      update();
      var response = await catsData.addCats(dataSent, file!);
      print("8888888888888AddCats888888888$response");
      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response['status'] == 'success') {
          Get.offNamed(Approutes.catsview);
          ViewCatsControllerImp c = Get.find();
          c.viewCats();
          Get.snackbar("Good", "Work");
        } else {
          requeststate = requeststatus.failaur;
        }
      } else {
        requeststate = requeststatus.serverFailaur;
      }
      //update();
    }
  }

  @override
  getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    return formattedTime;
  }

  @override
  goToAddCats() {
    Get.toNamed(Approutes.catsadd);
  }

  @override
  chooseImage() async {
    file = await fileUploadGallary(true);
    update();
  }
}
