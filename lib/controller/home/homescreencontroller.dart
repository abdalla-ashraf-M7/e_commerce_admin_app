import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  initialdata();
  goToViewCats();
  goToViewItems();
  goToOrdersScreen();
  gotonotifications();
}

class HomeScreenControllerImp extends HomeScreenController {
  String? id;
  String? username;
  MyServices myServices = Get.find();

  @override
  initialdata() {
    id = myServices.sharedPrefs!.getString("id");
    username = myServices.sharedPrefs!.getString("username");
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }

  @override
  gotonotifications() {
    Get.toNamed(Approutes.notifications);
  }

  @override
  goToViewCats() {
    Get.toNamed(Approutes.catsview);
  }

  @override
  goToViewItems() {
    Get.toNamed(Approutes.itemsview);
  }

  @override
  goToOrdersScreen() {
    Get.toNamed(Approutes.orderscreen);
  }
}
