import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/requeststatus.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/functions/saveuserdata.dart';
import '../../core/services/services.dart';
import '../../core/shared/defaultdialog.dart';
import '../../data/datasourse/remote/auth/logindata.dart';

abstract class LogInController extends GetxController {
  login();
  gotoforgetpassword();
  hidepassword();
  initialData();
}

class LogInControllerImp extends LogInController {
  GlobalKey<FormState>? loginformstate;
  TextEditingController? email;
  TextEditingController? password;
  bool ispasswordhidden = true;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  requeststatus reqeuststate = requeststatus.success;

  @override
  initialData() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("********$value");
    });
    loginformstate = GlobalKey();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  hidepassword() {
    if (ispasswordhidden == false) {
      ispasswordhidden = true;
    } else {
      ispasswordhidden = false;
    }
    update();
  }

  @override
  gotoforgetpassword() {
    Get.toNamed(Approutes.forgetpassword);
  }

  @override
  login() async {
    if (loginformstate!.currentState!.validate()) {
      reqeuststate = requeststatus.loading;
      update();
      var response = await loginData.getData(email!.text, password!.text);
      print("222222222222inlogin22222222222222$response");
      reqeuststate = handlingData(response);
      if (reqeuststate == requeststatus.success) {
        if (response["status"] == "success") {
          try {
            saveUserData(
              response['data']['admin_id'],
              response['data']['admin_name'],
              response['data']['admin_email'],
              response['data']['admin_password'],
              response['data']['admin_phone'],
            );
            String id = "${myServices.sharedPrefs!.getString("id")}";
            FirebaseMessaging.instance.subscribeToTopic("admin");
            FirebaseMessaging.instance.subscribeToTopic("admin$id");
            print("********************");
            Get.offAllNamed(Approutes.homescreen);
          } catch (e) {
            print("(???????????????????????????????$e)");
            defultDialog("Warning!!", "save user data error sorry try later", "Cancle", "try again", 60, 10, () {
              Get.offAllNamed(Approutes.login);
            }, () {
              Get.back();
            });
            update();
          }
        } else if (response["message"] == "xapprove") {
          reqeuststate = requeststatus.xapprove;
          defultDialog("Warning!!", "You need to verify your email first press verify and check your email we have sent you verification code", "Cancle", "Verify", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            //  Get.toNamed(Approutes.verifyemailsignup, arguments: {"email": email!.text});
          });
          update();
        } else if (response["message"] == "xwrong") {
          reqeuststate = requeststatus.failaur;
          defultDialog("Warning!!", "Email or passowrd is not correct", "Cancle", "Try Again", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            Get.back();
          });
          update();
        } else {
          reqeuststate == requeststatus.unknown2;
          update();
        }
      } else if (reqeuststate == requeststatus.unknown) {
        defultDialog("Warning!!", "Sorry it is unkown error try later", "Cancle", "Try Again", 60, 10, () {
          Get.offAllNamed(Approutes.login);
        }, () {
          Get.back();
        });
        update();
      }
      print("@@@@@@@@@@@@@@@inlogin@@@@@@@@@@@@@@@@ $reqeuststate");
      //update();
    }
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }
}
