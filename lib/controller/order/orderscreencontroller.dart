import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/view/screens/orders/accepted.dart';
import 'package:admin_ecommerce/view/screens/orders/archive.dart';
import 'package:admin_ecommerce/view/screens/orders/pendings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderScreenController extends GetxController {
  changepage(int i);
  gotocart();
}

class OrderScreenControllerImp extends OrderScreenController {
  int currentpage = 0;
  List<Widget> pagesinhome = [
    PendingsScreen(),
    AcceptdScreen(),
    ArchiveScreen(),
  ];
  List titlepagesinhome = [
    ["Pendings", "Aceppted", "Archive"],
    [Icons.watch_later_outlined, Icons.thumb_up, Icons.archive]
  ];

  @override
  changepage(int i) {
    currentpage = i;
    update();
  }

  @override
  gotocart() {
    Get.toNamed(Approutes.cart);
  }
}
