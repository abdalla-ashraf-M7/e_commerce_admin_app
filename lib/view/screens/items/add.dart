import 'package:admin_ecommerce/controller/items/addcitemscontroller.dart';
import 'package:admin_ecommerce/core/class/handlingdatview.dart';
import 'package:admin_ecommerce/core/constants/colors.dart';
import 'package:admin_ecommerce/core/functions/vaildator.dart';
import 'package:admin_ecommerce/core/shared/custombuttonglobal.dart';
import 'package:admin_ecommerce/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/customdrobdownsearch.dart';

class AddItemsScreen extends StatelessWidget {
  const AddItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddItemsControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add'),
        ),
        body: GetBuilder<AddItemsControllerImp>(
            builder: (controller) => HandlinDataView(
                  requeststat: controller.requeststate,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Form(
                      key: controller.addItemsKey,
                      child: ListView(
                        children: [
                          const SizedBox(height: 10),
                          CustomTextFormGlobal(
                            hint: "Enter The Item Name",
                            label: "Name",
                            textformcontroller: controller.name,
                            valid: (val) {
                              return ValidInput(val!, 2, 50, "");
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormGlobal(
                            hint: "Enter The Item Name In Arabic",
                            label: "Name AR",
                            textformcontroller: controller.nameAr,
                            valid: (val) {
                              return ValidInput(val!, 2, 50, "");
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormGlobal(
                            hint: "Enter The Item discribtion ",
                            label: "Discribtion",
                            textformcontroller: controller.desc,
                            valid: (val) {
                              return ValidInput(val!, 2, 50, "");
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormGlobal(
                            hint: "Enter The Item discribtion In Arabic",
                            label: "Discibtion AR",
                            textformcontroller: controller.decAr,
                            valid: (val) {
                              return ValidInput(val!, 2, 50, "");
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormGlobal(
                            hint: "Enter The Item Count ",
                            label: "Count",
                            textformcontroller: controller.count,
                            valid: (val) {
                              return ValidInput(val!, 1, 50, "");
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormGlobal(
                            hint: "Enter The Item Price ",
                            label: "Price",
                            textformcontroller: controller.price,
                            valid: (val) {
                              return ValidInput(val!, 1, 50, "");
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextFormGlobal(
                            hint: "Enter The Item discount ",
                            label: "Discount",
                            textformcontroller: controller.discount,
                            valid: (val) {
                              return ValidInput(val!, 1, 50, "");
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomDropDownSearch(title: "Catetgory Name", selectedlistname: controller.catname!, selectedlistid: controller.catid!, listdata: controller.drobdownlist),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 65),
                            child: MaterialButton(
                              color: Appcolors.pink1,
                              onPressed: () {
                                controller.chooseImage();
                              },
                              child: const Text("Add Image"),
                            ),
                          ),
                          const SizedBox(height: 15),
                          if (controller.file != null)
                            Container(
                                margin: const EdgeInsets.only(left: 55, right: 55, bottom: 15),
                                color: Appcolors.pink1,
                                height: 150,
                                child: Image.file(
                                  controller.file!,
                                  fit: BoxFit.fill,
                                )),
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: CustomButtonGlobal(
                                text: "Add New Product",
                                tap: () {
                                  controller.addItems();
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
