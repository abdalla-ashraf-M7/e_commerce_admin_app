import 'dart:io';
import 'package:admin_ecommerce/controller/items/viewitemscontroller.dart';
import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/core/constants/colors.dart';
import 'package:admin_ecommerce/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/catsdata.dart';
import '../../data/datasourse/remote/itemsdata.dart';

abstract class AddItemsController extends GetxController {
  addItems();
  goToAddItems();
  initalData();
  chooseImage();
  getCurrentTime();
  viewCats();
}

class AddItemsControllerImp extends AddItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  CatsData catsData = CatsData(Get.find());
  List<ItemsModel> data = [];
  List<SelectedListItem> drobdownlist = [];
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.none;
  TextEditingController? name;
  TextEditingController? nameAr;
  TextEditingController? desc;
  TextEditingController? decAr;
  TextEditingController? count;
  TextEditingController? price;
  TextEditingController? discount;
  TextEditingController? catid;
  TextEditingController? catname;

  File? file;
  GlobalKey<FormState> addItemsKey = GlobalKey<FormState>();

  @override
  initalData() {
    viewCats();
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    decAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  viewCats() async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await catsData.viewCats();
    print("8888888888888GetcatsinItems888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
        for (var i = 0; i < data.length; i++) {
          drobdownlist.add(SelectedListItem(name: data[i].catsName!, value: data[i].catsId));
        }
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  late Map dataSent = {
    "name": name!.text,
    "namear": nameAr!.text,
    "desc": desc!.text,
    "descar": decAr!.text,
    "count": count!.text,
    "price": price!.text,
    "discount": discount!.text,
    "time": getCurrentTime(),
    "catid": catid!.text,
  };

  @override
  addItems() async {
    if (addItemsKey.currentState!.validate()) {
      if (file == null) return Get.snackbar("Warning", "you Should Choose image");
      requeststate = requeststatus.loading;
      update();
      var response = await itemsData.addItems(dataSent, file!);
      print("8888888888888AddItems888888888$response");
      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response['status'] == 'success') {
          Get.offNamed(Approutes.itemsview);
          ViewItemsControllerImp c = Get.find();
          c.viewItems();
          Get.snackbar("Good", "New Product added successfully");
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
  goToAddItems() {
    Get.toNamed(Approutes.itemsadd);
  }

  @override
  chooseImage() async {
    Get.bottomSheet(Container(
      height: 170,
      color: Appcolors.white,
      child: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              alignment: AlignmentDirectional.topStart,
              child: const Text(
                "Choose Image",
                style: TextStyle(fontSize: 35, color: Appcolors.primarycolor),
              )),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () async {
                  Get.back();
                  file = await imageUploadCamer();

                  update();
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 60,
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  Get.back();
                  file = await fileUploadGallary(false);

                  update();
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.photo_camera_back_outlined,
                      size: 60,
                    ),
                    Text(
                      "Gallary",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));

    update();
  }
}
