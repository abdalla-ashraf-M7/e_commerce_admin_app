import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/order/orderscreencontroller.dart';
import '../../../core/constants/colors.dart';

class CustomBottomBarHome extends StatelessWidget {
  const CustomBottomBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(
      builder: (controller) => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...List.generate(controller.pagesinhome.length, ((index) {
              return MaterialButton(
                onPressed: () {
                  controller.changepage(index);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(controller.titlepagesinhome[1][index], color: controller.currentpage == index ? Appcolors.primarycolor : Appcolors.night2, size: 30),
                    Text(
                      "${controller.titlepagesinhome[0][index]}",
                      style: TextStyle(fontSize: 18, color: controller.currentpage == index ? Appcolors.primarycolor : Appcolors.night2),
                    )
                  ],
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}
