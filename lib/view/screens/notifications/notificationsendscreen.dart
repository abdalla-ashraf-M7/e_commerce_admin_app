import 'package:admin_ecommerce/controller/notifications/notificationscontroller.dart';
import 'package:admin_ecommerce/core/class/handlingdatview.dart';
import 'package:admin_ecommerce/core/constants/colors.dart';
import 'package:admin_ecommerce/core/functions/vaildator.dart';
import 'package:admin_ecommerce/core/shared/custombuttonglobal.dart';
import 'package:admin_ecommerce/core/shared/customtextformglobal.dart';
import 'package:admin_ecommerce/view/widgets/notifications/customchoosewho.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSendScreen extends StatelessWidget {
  const NotificationSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificatoionsControllerImp());
    return Scaffold(
      appBar: AppBar(title: Text("Notificaions")),
      body: GetBuilder<NotificatoionsControllerImp>(
          builder: (controller) => HandlinDataView(
              requeststat: controller.requeststate,
              widget: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                      key: controller.notificationKey,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                              child: Text(
                            "Tell them what's New!!",
                            style: TextStyle(fontSize: 30, color: Appcolors.primarycolor),
                          )),
                          SizedBox(height: 20),
                          customChooseWho(),
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                CustomTextFormGlobal(
                                  hint: "Enter the notification title",
                                  label: "Title",
                                  textformcontroller: controller.title,
                                  valid: (val) {
                                    return ValidInput(val!, 2, 50, "");
                                  },
                                ),
                                SizedBox(height: 20),
                                CustomTextFormGlobal(
                                  hint: "Enter the notification body",
                                  label: "Body",
                                  textformcontroller: controller.body,
                                  valid: (val) {
                                    return ValidInput(val!, 2, 100, "");
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40),
                          CustomButtonGlobal(
                            text: "Send Notification",
                            tap: () {
                              controller.sendNotification();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
