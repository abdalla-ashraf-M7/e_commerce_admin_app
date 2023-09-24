import 'package:admin_ecommerce/controller/cats/viewcatscontroller.dart';
import 'package:admin_ecommerce/core/class/handlingdatview.dart';
import 'package:admin_ecommerce/core/constants/applinks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewCatsScreen extends StatelessWidget {
  const ViewCatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ViewCatsControllerImp controller = Get.put(ViewCatsControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GetBuilder<ViewCatsControllerImp>(
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
                              controller.goToEditCats(controller.data[index]);
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
                                          child: SvgPicture.network(
                                            "${AppLinks.catsimages}/${controller.data[index].catsImage}",
                                          ))),
                                  Expanded(
                                      flex: 5,
                                      child: ListTile(
                                        title: Text(
                                          controller.data[index].catsName!,
                                          style: const TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        subtitle: Text(
                                          controller.data[index].catsDate!,
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            controller.deleteCats(controller.data[index]);
                                          },
                                          icon: Icon(Icons.delete),
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
          controller.goToAddCats();
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
