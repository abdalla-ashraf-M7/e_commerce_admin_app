import 'dart:io';
import 'package:admin_ecommerce/controller/cats/viewcatscontroller.dart';
import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/data/datasourse/remote/catsdata.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../core/services/services.dart';

abstract class EditCatController extends GetxController {
  editCats();
  goToAddCats();
  initalData();
  chooseImage();
}

class EditCatControllerImp extends EditCatController {
  CatsData catsData = CatsData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.none;
  TextEditingController? name;
  TextEditingController? nameAr;
  File? file;
  GlobalKey<FormState> addCatsKey = GlobalKey<FormState>();
  late CategoriesModel rcategoriesModel;

  @override
  initalData() {
    rcategoriesModel = Get.arguments['catsmodel'];
    name = TextEditingController();
    nameAr = TextEditingController();
    name!.text = rcategoriesModel.catsName!;
    nameAr!.text = rcategoriesModel.catsNameAr!;
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  late Map dataSent = {"name": name!.text, "namear": nameAr!.text, "catid": rcategoriesModel.catsId, "imageold": rcategoriesModel.catsImage};

  @override
  editCats() async {
    if (addCatsKey.currentState!.validate()) {
      requeststate = requeststatus.loading;
      update();
      var response = await catsData.editCats(dataSent, file);
      print("8888888888888EditCats888888888$response");
      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response['status'] == 'success') {
          Get.offNamed(Approutes.catsview);
          ViewCatsControllerImp c = Get.find();
          c.viewCats();
          Get.snackbar("Good", "Edited");
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
  goToAddCats() {
    Get.toNamed(Approutes.catsadd);
  }

  @override
  chooseImage() async {
    file = await fileUploadGallary(true);
    update();
  }
}
