import 'package:get/get.dart';
import '../../core/class/requeststatus.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/orders/ordersdata.dart';
import '../../data/model/ordersmodel.dart';

abstract class ArchiveOrderController extends GetxController {
  geArchivedtOrders();
  initalData();
  refreshMyOrderspage();
  String rPaymentMethod(String val);
  String rOrderType(String val);
  String rOrderStatus(String val);
  gotoDetails(OrdersModel ordersModel);
}

class ArchiveOrderControllerImp extends ArchiveOrderController {
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.success;
  List<OrdersModel> data = [];

  @override
  initalData() {
    geArchivedtOrders();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  geArchivedtOrders() async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await orderData.archivesOrders();
    print("8888888888888ArchivedOrders888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        data.addAll(responsedata.map((e) => OrdersModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  @override
  String rOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "Preparing";
    } else if (val == "2") {
      return "Dilevery Guy Recieved";
    } else if (val == "3") {
      return "On the way";
    } else {
      return "Archived";
    }
  }

  @override
  String rOrderType(String val) {
    if (val == "1") {
      return "Dilevery";
    } else {
      return "Drive Thru";
    }
  }

  @override
  String rPaymentMethod(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }

  @override
  gotoDetails(ordersModel) {
    Get.toNamed(Approutes.orderdetails, arguments: {"ordermodel": ordersModel});
  }

  @override
  refreshMyOrderspage() {
    geArchivedtOrders();
  }
}
