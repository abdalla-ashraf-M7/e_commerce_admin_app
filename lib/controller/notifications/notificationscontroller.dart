import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/data/datasourse/remote/notifications/notificationsdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';

abstract class NotificatoionsController extends GetxController {
  sendNotification();
  initalData();
  getCurrentTime();
  toWho(String val);
}

class NotificatoionsControllerImp extends NotificatoionsController {
  NotificationsData notificationsData = NotificationsData(Get.find());
  requeststatus requeststate = requeststatus.success;
  String? notifyToWho;
  GlobalKey<FormState> notificationKey = GlobalKey<FormState>();
  TextEditingController? title;
  TextEditingController? body;

  @override
  initalData() {
    title = TextEditingController();
    body = TextEditingController();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  sendNotification() async {
    if (notificationKey.currentState!.validate()) {
      if (notifyToWho != null) {
        requeststate = requeststatus.loading;
        update();
        var response = await notificationsData.sendNotify(
          title!.text,
          body!.text,
          getCurrentTime(),
          notifyToWho!,
        );
        print("8888888888888SendNotification888888888$response");
        requeststate = handlingData(response);
        if (requeststate == requeststatus.success) {
          if (response['status'] == 'success') {
            Get.snackbar("Success", "The notification sent successfully");
            Get.offAllNamed(Approutes.homescreen);
            update();
          } else {
            requeststate = requeststatus.failaur;
            update();
          }
          update();
        } else {
          update();
        }
        //update();
      } else {
        Get.snackbar("Warning", "You should choose if it is for Users or Delivery");
      }
    }
  }

  @override
  toWho(val) {
    notifyToWho = val;
    update();
  }

  @override
  getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    return formattedTime;
  }
}
