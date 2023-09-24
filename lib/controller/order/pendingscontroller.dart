import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/class/requeststatus.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/orders/ordersdata.dart';
import '../../data/model/ordersmodel.dart';

abstract class PendingsController extends GetxController {
  viewOrders();
  initalData();
  String rPaymentMethod(String val);
  String rOrderType(String val);
  String rOrderStatus(String val);
  refreshMyOrderspage();
  gotoDetails(OrdersModel ordersModel);
  approveOrder(String orderid, String userid);
  getCurrentTime();
  //prepareOrder(String orderid, String userid, String ordertype);
}

class PendingsControllerImp extends PendingsController {
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.success;
  List<OrdersModel> data = [];

  @override
  initalData() {
    viewOrders();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  viewOrders() async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await orderData.viewPendings();
    print("8888888888888viewOrders888888888$response");
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
  approveOrder(orderid, userid) async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await orderData.approvOrder(
      orderid,
      userid,
      getCurrentTime(),
    );
    print("8888888888888getOrders888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        viewOrders();
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {}
    update();
  }

  /*  @override
  prepareOrder(orderid, userid, ordertype) async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await orderData.prepareOrder(orderid, userid, ordertype);
    print("8888888888888getOrders888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        viewOrders();
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  } */

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
  refreshMyOrderspage() {
    viewOrders();
  }

  @override
  gotoDetails(ordersModel) {
    Get.toNamed(Approutes.orderdetails, arguments: {"ordermodel": ordersModel});
  }

  @override
  getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    return formattedTime;
  }
}
