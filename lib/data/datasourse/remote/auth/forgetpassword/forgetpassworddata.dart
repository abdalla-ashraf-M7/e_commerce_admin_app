import '../../../../../core/class/curd.dart';
import '../../../../../core/constants/applinks.dart';

class ForgetPasswordData {
  Crud crud = Crud();
  ForgetPasswordData(this.crud);

  getData(String email) async {
    var response = await crud.postData(AppLinks.forgetpassword, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
