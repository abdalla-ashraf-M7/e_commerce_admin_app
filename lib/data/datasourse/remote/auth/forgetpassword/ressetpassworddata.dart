import '../../../../../core/class/curd.dart';
import '../../../../../core/constants/applinks.dart';

class RessetPasswordData {
  Crud crud = Crud();
  RessetPasswordData(this.crud);

  getData(String email, String password) async {
    var response = await crud.postData(AppLinks.ressetpassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
