import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/class/requeststatus.dart';
import '../../core/constants/approutes.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/orders/ordersdata.dart';
import '../../data/model/ordersmodel.dart';

abstract class AcceptedController extends GetxController {
  getAccepted();
  initalData();
  String rPaymentMethod(String val);
  String rOrderType(String val);
  String rOrderStatus(String val);
  refreshMyOrderspage();
  gotoDetails(int i);
  prepareOrder(String orderid, String userid, String ordertype);
  getCurrentTime();
}

class AcceptedControllerImp extends AcceptedController {
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  requeststatus requeststate = requeststatus.success;
  List<OrdersModel> data = [];

  @override
  initalData() {
    getAccepted();
  }

  @override
  void onInit() {
    initalData();
    super.onInit();
  }

  @override
  getAccepted() async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await orderData.viewAcceptedandOthers();
    print("8888888888888getAccepteds888888888$response");
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
  prepareOrder(orderid, userid, ordertype) async {
    requeststate = requeststatus.loading;
    update();
    data.clear();
    var response = await orderData.prepareOrder(
      orderid,
      userid,
      ordertype,
      getCurrentTime(),
    );
    print("8888888888888doneOrder888888888$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        getAccepted();
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
      return "prepard";
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
    getAccepted();
  }

  @override
  gotoDetails(i) {
    print("*****************");
    Get.toNamed(Approutes.orderdetails, arguments: {"ordermodel": data[i]});
  }

  @override
  getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    return formattedTime;
  }
}
