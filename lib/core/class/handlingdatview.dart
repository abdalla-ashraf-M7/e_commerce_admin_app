import 'package:admin_ecommerce/core/class/requeststatus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import '../constants/imageassets.dart';

class HandlinDataView extends StatelessWidget {
  const HandlinDataView({super.key, required this.requeststat, required this.widget});
  final requeststatus requeststat;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return requeststat == requeststatus.loading
        ? ListView(
            children: [Container(height: Get.height - 140, child: Center(child: Lottie.asset(Appimageassets.loading, width: 300)))],
          )
        : requeststat == requeststatus.offlineFailaur
            ? ListView(
                children: [Container(height: Get.height - 140, child: Center(child: Lottie.asset(Appimageassets.offline, width: 600)))],
              )
            : requeststat == requeststatus.serverFailaur
                ? ListView(
                    children: [Container(height: Get.height - 140, child: Center(child: Lottie.asset(Appimageassets.server, width: 300)))],
                  )
                : requeststat == requeststatus.failaur
                    ? ListView(
                        children: [Container(height: Get.height - 140, child: Center(child: Lottie.asset(Appimageassets.nodata, width: 300)))],
                      )
                    : requeststat == requeststatus.unknown
                        ? ListView(
                            shrinkWrap: true,
                            children: [
                              Container(height: Get.height - 140, child: Center(child: Text("unknown error"))),
                            ],
                          )
                        : widget;
  }
}

class HandlinDataRequest extends StatelessWidget {
  const HandlinDataRequest({super.key, required this.requeststat, required this.widget});
  final requeststatus requeststat;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return requeststat == requeststatus.loading
        ? Center(child: Lottie.asset(Appimageassets.loading, width: 300))
        : requeststat == requeststatus.offlineFailaur
            ? Center(child: Lottie.asset(Appimageassets.offline, width: 600))
            : requeststat == requeststatus.serverFailaur
                ? Center(child: Lottie.asset(Appimageassets.server, width: 300))
                : requeststat == requeststatus.unknown
                    ? const Center(child: Center(child: Text("unknown error")))
                    : widget;
  }
}
