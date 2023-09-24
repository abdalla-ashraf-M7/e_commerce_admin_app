import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/core/shared/defaultdialog.dart';
import 'package:admin_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/itemsdata.dart';

abstract class ViewItemsController extends GetxController {
  viewItems();
  getBack();
  goToAddItems();
  goToEditItems(ItemsModel itemsModel);
  initalData();
  deleteItems(ItemsModel itemsModel);
}

class ViewItemsControllerImp extends ViewItemsController {
  ItemsData itemsData = ItemsData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.none;
  List<ItemsModel> data = [];
  Map dataForDelete = {};

  @override
  initalData() {
    viewItems();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  viewItems() async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await itemsData.viewItems();
    print("8888888888888ViewItems888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  @override
  deleteItems(itemsModel) async {
    defultDialog("Warningd", "Are you sure you want to delete ${itemsModel.itemsName} category? this can't be undone", "Confirm", "Cancel", 10, 10, () async {
      Get.back();
      data.removeWhere((element) => element.itemsId == itemsModel.itemsId);
      dataForDelete = {"itemid": itemsModel.itemsId, "imagename": itemsModel.itemsImage};
      var response = await itemsData.deleteItems(dataForDelete);
      print("8888888888888deleteItems888888888$response");
      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response['status'] == 'success') {
          Get.snackbar("success", "the Item is deleted successfully");
        } else {
          requeststate = requeststatus.failaur;
        }
      } else {}
      update();
    }, () {
      Get.back();
    });
  }

  @override
  goToAddItems() {
    Get.toNamed(Approutes.itemsadd);
  }

  @override
  getBack() {
    Get.offAllNamed(Approutes.homescreen);
  }

  @override
  goToEditItems(itemsModel) {
    Get.toNamed(Approutes.itemsedit, arguments: {"itemsmodel": itemsModel});
  }
}
