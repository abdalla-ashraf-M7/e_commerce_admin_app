import 'dart:io';
import 'package:admin_ecommerce/controller/items/viewitemscontroller.dart';
import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/data/datasourse/remote/catsdata.dart';
import 'package:admin_ecommerce/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/requeststatus.dart';
import '../../core/constants/colors.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/uploadfile.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/itemsdata.dart';

abstract class EditItemsController extends GetxController {
  editItems();
  initalData();
  chooseImage();
  viewCats();
  changeActive(String val);
}

class EditItemsControllerImp extends EditItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.none;
  List<SelectedListItem> drobdownlist = [];
  TextEditingController? name;
  TextEditingController? nameAr;
  TextEditingController? desc;
  TextEditingController? decAr;
  TextEditingController? count;
  TextEditingController? active;
  TextEditingController? price;
  TextEditingController? discount;
  TextEditingController? catid;
  TextEditingController? catname;
  File? file;
  GlobalKey<FormState> addItemsKey = GlobalKey<FormState>();
  late ItemsModel rItemsModel;
  String? isActive;

  @override
  initalData() {
    rItemsModel = Get.arguments['itemsmodel'];
    viewCats();
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    decAr = TextEditingController();
    count = TextEditingController();
    active = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();
    name!.text = rItemsModel.itemsName!;
    nameAr!.text = rItemsModel.itemsNameAr!;
    desc!.text = rItemsModel.itemsDesc!;
    decAr!.text = rItemsModel.itemsDescAr!;
    count!.text = rItemsModel.itemsCount!;
    active!.text = rItemsModel.itemsActive!;
    price!.text = rItemsModel.itemsPrice!;
    discount!.text = rItemsModel.itemsDiscount!;
    catid!.text = rItemsModel.itemsCats!;
    catname!.text = rItemsModel.catsName!;
    isActive = rItemsModel.itemsActive;
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  late Map dataSent = {
    "name": name!.text,
    "namear": nameAr!.text,
    "itemid": rItemsModel.itemsId,
    "imageold": rItemsModel.itemsImage,
    "desc": desc!.text,
    "descar": decAr!.text,
    "count": count!.text,
    "active": isActive,
    "price": price!.text,
    "discount": discount!.text,
    "catid": catid!.text,
  };

  @override
  editItems() async {
    if (addItemsKey.currentState!.validate()) {
      requeststate = requeststatus.loading;
      update();
      var response = await itemsData.editItems(dataSent, file);
      print("8888888888888EditItems888888888$response");
      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response['status'] == 'success') {
          Get.offNamed(Approutes.itemsview);
          ViewItemsControllerImp c = Get.find();
          c.viewItems();
          Get.snackbar("Good", "Edited");
        } else {
          Get.snackbar("Warning", "Editing Items Fails");
          update();
          Get.offNamed(Approutes.homescreen);
        }
      } else {
        Get.snackbar("Warning", "Editing Items Fails2");
        update();
        Get.offNamed(Approutes.homescreen);
      }
      //update
    }
  }

  @override
  viewCats() async {
    CatsData catsData = CatsData(Get.find());
    requeststate = requeststatus.loading;
    List<ItemsModel> data = [];

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
    } else {}
    update();
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

  @override
  changeActive(val) {
    isActive = val;
    update();
  }
}
