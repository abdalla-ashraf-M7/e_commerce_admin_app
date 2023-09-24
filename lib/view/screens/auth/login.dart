import '../../../../core/class/handlingdatview.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/imageassets.dart';
import '../../../../core/functions/vaildator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth/logincontroller.dart';
import '../../../core/functions/exitalert.dart';
import '../../widgets/auth/custombodyauth.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/customforgetpassauth.dart';
import '../../widgets/auth/customrowsignupauth.dart';
import '../../widgets/auth/customtextformauth.dart';
import '../../widgets/auth/customtitleauth.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(LogInControllerImp());
    return Scaffold(
        backgroundColor: Appcolors.white,
        appBar: AppBar(
          backgroundColor: Appcolors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "9".tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
          ),
        ),
        body: WillPopScope(
            onWillPop: exitAlert,
            child: GetBuilder<LogInControllerImp>(
                builder: (controller) => HandlinDataRequest(
                    requeststat: controller.reqeuststate,
                    widget: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      width: double.infinity,
                      child: ListView(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(Appimageassets.newlogo, height: 100),
                          const SizedBox(height: 30),
                          CustomTitleAuth(
                            title: '10'.tr,
                          ),
                          const SizedBox(height: 30),
                          CustomBodyAuth(body: "11".tr),
                          const SizedBox(height: 30),
                          Form(
                              key: controller.loginformstate,
                              child: Column(
                                children: [
                                  CustomTextFormAuth(
                                    valid: (val) {
                                      return ValidInput(val!, 5, 50, "email");
                                    },
                                    hint: "12".tr,
                                    label: "13".tr,
                                    icon: Icons.email_outlined,
                                    textformcontroller: controller.email,
                                  ),
                                  const SizedBox(height: 20),
                                  GetBuilder<LogInControllerImp>(
                                    builder: (controller) => CustomTextFormAuth(
                                      isobscure: controller.ispasswordhidden,
                                      ontapicon: () {
                                        controller.hidepassword();
                                      },
                                      valid: (val) {
                                        return ValidInput(val!, 5, 50, "passsword");
                                      },
                                      hint: "14".tr,
                                      label: "15".tr,
                                      icon: Icons.lock_outline,
                                      textformcontroller: controller.password,
                                    ),
                                  )
                                ],
                              )),
                          const SizedBox(height: 20),
                          CustomForgetAuth(
                            tap: () {
                              controller.gotoforgetpassword();
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomButtonAuth(
                            text: "8".tr,
                            tap: () {
                              controller.login();
                            },
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    )))));
  }
}
