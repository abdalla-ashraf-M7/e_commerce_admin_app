import 'dart:io';

import '../../../../core/class/curd.dart';
import '../../../../core/constants/applinks.dart';

class ItemsData {
  Crud crud = Crud();

  ItemsData(this.crud);

  viewItems() async {
    var response = await crud.postData(AppLinks.viewItems, {});
    return response.fold((l) => l, (r) => r);
  }

  addItems(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(AppLinks.addItems, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editItems(Map data, [File? file]) async {
    if (file == null) {
      var response = await crud.postData(AppLinks.editItems, data);
      return response.fold((l) => l, (r) => r);
    } else {
      var response = await crud.addRequestWithImageOne(AppLinks.editItems, data, file);
      return response.fold((l) => l, (r) => r);
    }
  }

  deleteItems(Map data) async {
    var response = await crud.postData(AppLinks.deleteItems, data);
    return response.fold((l) => l, (r) => r);
  }
}
