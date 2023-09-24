import 'package:admin_ecommerce/controller/items/viewitemscontroller.dart';
import 'package:admin_ecommerce/core/class/handlingdatview.dart';
import 'package:admin_ecommerce/core/constants/applinks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ViewItemsScreen extends StatelessWidget {
  const ViewItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ViewItemsControllerImp controller = Get.put(ViewItemsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GetBuilder<ViewItemsControllerImp>(
          builder: (controller) => HandlinDataView(
              requeststat: controller.requeststate,
              widget: WillPopScope(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 100,
                          child: InkWell(
                            onTap: () {
                              controller.goToEditItems(controller.data[index]);
                            },
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Container(
                                          //color: Colors.amber,
                                          padding: const EdgeInsets.symmetric(vertical: 2),
                                          height: 80,
                                          child: CachedNetworkImage(
                                            imageUrl: "${AppLinks.itmesimages}/${controller.data[index].itemsImage}",
                                          ))),
                                  Expanded(
                                      flex: 5,
                                      child: ListTile(
                                        title: Text(
                                          controller.data[index].itemsName!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        subtitle: Text(
                                          controller.data[index].itemsDate!,
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            controller.deleteItems(controller.data[index]);
                                          },
                                          icon: const Icon(Icons.delete),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  onWillPop: () {
                    controller.getBack();
                    return Future.value(false);
                  }))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.goToAddItems();
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
