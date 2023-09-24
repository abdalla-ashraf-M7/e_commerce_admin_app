import 'package:admin_ecommerce/controller/notifications/notificationscontroller.dart';
import 'package:admin_ecommerce/core/constants/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';

class customChooseWho extends GetView<NotificatoionsControllerImp> {
  const customChooseWho({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.toWho("1");
            },
            child: controller.notifyToWho == "1"
                ? Container(
                    decoration: BoxDecoration(color: Appcolors.primarycolor, borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.white)),
                    height: 160,
                    width: 150,
                    child: Column(
                      children: [
                        const Text("Users", style: TextStyle(color: Appcolors.white, fontSize: 20)),
                        Container(
                          width: 150,
                          child: Image.asset(
                            Appimageassets.user,
                            color: Appcolors.white,
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.primarycolor)),
                    height: 160,
                    width: 150,
                    child: Column(
                      children: [
                        const Text("Users", style: TextStyle(color: Appcolors.primarycolor, fontSize: 20)),
                        Container(
                          width: 150,
                          child: Image.asset(
                            Appimageassets.user,
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(width: 45),
          InkWell(
            onTap: () {
              controller.toWho("2");
            },
            child: controller.notifyToWho == "2"
                ? Container(
                    decoration: BoxDecoration(color: Appcolors.primarycolor, borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.white)),
                    height: 160,
                    width: 150,
                    child: Column(
                      children: [
                        const Text("Delivery", style: TextStyle(color: Appcolors.white, fontSize: 20)),
                        Image.asset(
                          Appimageassets.deliveryguy1,
                          height: 120,
                          color: Appcolors.white,
                        ),
                      ],
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: 2, color: Appcolors.primarycolor)),
                    height: 160,
                    width: 150,
                    child: Column(
                      children: [
                        const Text("Delivery", style: TextStyle(color: Appcolors.primarycolor, fontSize: 20)),
                        SizedBox(height: 1),
                        Image.asset(
                          Appimageassets.deliveryguy1,
                          height: 120,
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
