//import 'package:e_commerce/core/class/curd.dart';
import 'package:get/get.dart';

import '../class/curd.dart';

class MyBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
