import 'package:admin_ecommerce/controller/cats/editcatscontroller.dart';
import 'package:admin_ecommerce/core/class/handlingdatview.dart';
import 'package:admin_ecommerce/core/constants/colors.dart';
import 'package:admin_ecommerce/core/functions/vaildator.dart';
import 'package:admin_ecommerce/core/shared/custombuttonglobal.dart';
import 'package:admin_ecommerce/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditCatsScreen extends StatelessWidget {
  const EditCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditCatControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit'),
        ),
        body: GetBuilder<EditCatControllerImp>(
            builder: (controller) => HandlinDataView(
                  requeststat: controller.requeststate,
                  widget: Container(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Form(
                        key: controller.addCatsKey,
                        child: ListView(
                          children: [
                            CustomTextFormGlobal(
                              hint: "Enter The Categories Name",
                              label: "Name",
                              textformcontroller: controller.name,
                              valid: (val) {
                                return ValidInput(val!, 2, 50, "");
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFormGlobal(
                              hint: "Enter The Categories Name In Arabic",
                              label: "Name AR",
                              textformcontroller: controller.nameAr,
                              valid: (val) {
                                return ValidInput(val!, 2, 50, "");
                              },
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 80),
                              child: MaterialButton(
                                color: Appcolors.pink1,
                                onPressed: () {
                                  controller.chooseImage();
                                },
                                child: const Text("Edit SVG image"),
                              ),
                            ),
                            if (controller.file != null) SvgPicture.file(controller.file!),
                            const SizedBox(height: 15),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: CustomButtonGlobal(
                                  text: "Edit Cart",
                                  tap: () {
                                    controller.editCats();
                                  },
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                )));
  }
}
