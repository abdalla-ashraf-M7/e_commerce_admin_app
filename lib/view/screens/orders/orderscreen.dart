import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/orderscreencontroller.dart';
import '../../widgets/homewidgets/custombottombar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: const CustomBottomBarHome(),
              body: controller.pagesinhome[controller.currentpage],
            ));
  }
}
