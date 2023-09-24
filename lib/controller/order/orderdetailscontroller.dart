import 'dart:async';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../core/class/requeststatus.dart';
import '../../core/functions/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasourse/remote/orders/ordersdata.dart';
import '../../data/model/cartviewmodel.dart';
import '../../data/model/ordersmodel.dart';

abstract class OrderDetailsController extends GetxController {
  initialData();
  initialposition();
  addmarker(LatLng latLng);
  getOrderDetails();
}

class OrderDetailsControllerImp extends OrderDetailsController {
  late OrdersModel rOrderModel;
  Completer<GoogleMapController>? completercontroller;
  CameraPosition? initPosition;
  List<Marker> markers = [];
  requeststatus requeststate = requeststatus.success;
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  List<CartViewModel> dataCartModel = [];

  @override
  initialData() async {
    rOrderModel = Get.arguments['ordermodel'];
    if (rOrderModel.ordersType == "1" && rOrderModel.addressName != null) {
      await initialposition();
      addmarker(LatLng(double.parse("${rOrderModel.addressLat}"), double.parse("${rOrderModel.addressLong}")));
      completercontroller = Completer<GoogleMapController>();
    }
    getOrderDetails();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }

  @override
  getOrderDetails() async {
    requeststate = requeststatus.loading;
    update();
    dataCartModel.clear();
    var response = await orderData.orderDetails(
      "${rOrderModel.ordersId}",
    );
    print("99999999999999999getorderdetails$response");
    requeststate = handlingData(response);
    if (requeststate == requeststatus.success) {
      if (response['status'] == 'success') {
        List responsedata = response['data'];
        dataCartModel.addAll(responsedata.map((e) => CartViewModel.fromJson(e)));
      } else {
        requeststate = requeststatus.failaur;
      }
    } else {
      requeststate = requeststatus.serverFailaur;
    }
    update();
  }

  @override
  initialposition() async {
    initPosition = CameraPosition(
      target: LatLng(double.parse("${rOrderModel.addressLat}"), double.parse("${rOrderModel.addressLong}")),
      zoom: 14,
    );
    requeststate = requeststatus.success;
    update();
  }

  @override
  addmarker(latLng) {
    markers.clear();
    markers.add(Marker(markerId: MarkerId('1'), position: latLng));
    update();
  }
}
