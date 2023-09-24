import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import '../../../controller/order/archiveordercontroller.dart';
import '../../../core/constants/colors.dart';
import '../../../data/model/ordersmodel.dart';

class CustomCardOrdersArchive extends StatelessWidget {
  const CustomCardOrdersArchive({super.key, required this.ordersModel, required this.i, this.onTapDetails});
  final OrdersModel ordersModel;
  final int i;
  final void Function()? onTapDetails;
  @override
  Widget build(BuildContext context) {
    ArchiveOrderControllerImp controller = Get.put(ArchiveOrderControllerImp());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        shape: const ContinuousRectangleBorder(side: BorderSide(color: Appcolors.primarycolor)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          width: double.infinity,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Number: ${ordersModel.ordersId}",
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  Jiffy.parse('${ordersModel.ordersDate}').fromNow() // 25 years ago
// 5 years ago
                  ,
                  style: const TextStyle(fontSize: 16, color: Appcolors.primarycolor),
                ),
              ],
            ),
            const Divider(thickness: 2),
            Text(
              "Order Type: ${controller.rOrderType("${ordersModel.ordersType}")}",
              style: const TextStyle(fontSize: 23, color: Appcolors.grey5),
            ),
            Text(
              "Order Price: ${ordersModel.ordersPrice} \$",
              style: const TextStyle(fontSize: 23, color: Appcolors.grey5),
            ),
            Text(
              "Dilevery Price: ${ordersModel.ordersDileveryprice} \$",
              style: const TextStyle(fontSize: 23, color: Appcolors.grey5),
            ),
            Text(
              "Payment Method: ${controller.rPaymentMethod("${ordersModel.ordersPaymentmethod}")}",
              style: const TextStyle(fontSize: 23, color: Appcolors.grey5),
            ),
            Text(
              "Order Status: ${controller.rOrderStatus("${ordersModel.ordersStatus}")}",
              style: const TextStyle(fontSize: 23, color: Appcolors.grey5),
            ),
            const Divider(thickness: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price: ${ordersModel.ordersTotalprice}\$",
                  style: const TextStyle(fontSize: 23),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (ordersModel.ordersStatus == "4")
                      const SizedBox(
                        width: 10,
                      ),
                    MaterialButton(
                        height: 38,
                        color: Appcolors.primarycolor,
                        onPressed: onTapDetails,
                        child: const Text(
                          "Detatils",
                          style: TextStyle(fontSize: 20, color: Appcolors.white),
                        )),
                  ],
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
