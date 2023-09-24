import 'dart:io';

import '../../../../core/class/curd.dart';
import '../../../../core/constants/applinks.dart';

class CatsData {
  Crud crud = Crud();

  CatsData(this.crud);

  viewCats() async {
    var response = await crud.postData(AppLinks.viewCats, {});
    return response.fold((l) => l, (r) => r);
  }

  addCats(Map data, File file) async {
    var response = await crud.addRequestWithImageOne(AppLinks.addCats, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editCats(Map data, [File? file]) async {
    if (file == null) {
      var response = await crud.postData(AppLinks.editCats, data);
      return response.fold((l) => l, (r) => r);
    } else {
      var response = await crud.addRequestWithImageOne(AppLinks.editCats, data, file);
      return response.fold((l) => l, (r) => r);
    }
  }

  deleteCats(Map data) async {
    var response = await crud.postData(AppLinks.deleteCats, data);
    return response.fold((l) => l, (r) => r);
  }
}
