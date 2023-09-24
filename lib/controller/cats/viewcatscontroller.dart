import 'package:admin_ecommerce/core/constants/approutes.dart';
import 'package:admin_ecommerce/core/shared/defaultdialog.dart';
import 'package:admin_ecommerce/data/datasourse/remote/catsdata.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:get/get.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';

abstract class ViewCatsController extends GetxController {
  viewCats();
  getBack();
  goToAddCats();
  goToEditCats(CategoriesModel catsmodel);
  initalData();
  deleteCats(CategoriesModel categoriesModel);
}

class ViewCatsControllerImp extends ViewCatsController {
  CatsData catsData = CatsData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.none;
  List<CategoriesModel> data = [];
  Map dataForDelete = {};

  @override
  initalData() {
    viewCats();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  viewCats() async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await catsData.viewCats();
    print("8888888888888ViewCats888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => CategoriesModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  @override
  deleteCats(categoriesModel) async {
    defultDialog("Warning", "Are you sure you want to delete ${categoriesModel.catsName} category? this can't be undone", "Confirm", "Cancel", 10, 10, () async {
      Get.back();
      data.removeWhere((element) => element.catsId == categoriesModel.catsId);
      dataForDelete = {"catid": categoriesModel.catsId, "imagename": categoriesModel.catsImage};
      var response = await catsData.deleteCats(dataForDelete);
      print("8888888888888deleteCats888888888$response");
      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response['status'] == 'success') {
          Get.snackbar("success", "the categorie is deleted successfully");
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
  goToAddCats() {
    Get.toNamed(Approutes.catsadd);
  }

  @override
  getBack() {
    Get.offAllNamed(Approutes.homescreen);
  }

  @override
  goToEditCats(catsmodel) {
    Get.toNamed(Approutes.catsedit, arguments: {"catsmodel": catsmodel});
  }
}
