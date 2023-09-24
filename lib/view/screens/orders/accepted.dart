import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/order/acceptedcontroller.dart';
import '../../../core/class/handlingdatview.dart';
import '../../widgets/order/customorderlistaccepted.dart';

class AcceptdScreen extends StatelessWidget {
  const AcceptdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accepted'),
      ),
      body: GetBuilder<AcceptedControllerImp>(
          builder: (controller) => RefreshIndicator(
              child: HandlinDataView(
                  requeststat: controller.requeststate,
                  widget: ListView(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 5);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return CustomCardOrdersAccepted(
                            ordersModel: controller.data[index],
                            i: index,
                            onTapDetails: () {
                              controller.gotoDetails(index);
                            },
                            onTapIconCheck: () {
                              controller.prepareOrder(controller.data[index].ordersId!, controller.data[index].ordersUser!, controller.data[index].ordersType!);
                            },
                          );
                        },
                      ),
                    ],
                  )),
              onRefresh: () async {
                controller.refreshMyOrderspage();
              })),
    );
  }
}
