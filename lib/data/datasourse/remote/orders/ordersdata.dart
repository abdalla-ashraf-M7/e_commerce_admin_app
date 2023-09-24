import 'package:get/get.dart';
import '../../../../core/class/curd.dart';
import '../../../../core/constants/applinks.dart';

class OrderData {
  Crud crud = Get.find();
  OrderData(this.crud);

  viewPendings() async {
    var reponse = await crud.postData(AppLinks.orderpendings, {});
    return reponse.fold((l) => l, (r) => r);
  }

  prepareOrder(String orderid, String userid, String ordertype, String time) async {
    var reponse = await crud.postData(AppLinks.orderPrepare, {"orderid": orderid, "userid": userid, "ordertype": ordertype, "time": time});
    return reponse.fold((l) => l, (r) => r);
  }

  approvOrder(String orderid, String userid, String time) async {
    var reponse = await crud.postData(AppLinks.orderApprove, {
      "orderid": orderid,
      "userid": userid,
      "time": time,
    });
    return reponse.fold((l) => l, (r) => r);
  }

  archivesOrders() async {
    var reponse = await crud.postData(AppLinks.orderArchive, {});
    return reponse.fold((l) => l, (r) => r);
  }

  viewAcceptedandOthers() async {
    var reponse = await crud.postData(AppLinks.viewAccepted, {});
    return reponse.fold((l) => l, (r) => r);
  }

  orderDetails(String orderid) async {
    var reponse = await crud.postData(AppLinks.orderdetails, {"orderid": orderid});
    return reponse.fold((l) => l, (r) => r);
  }
}
