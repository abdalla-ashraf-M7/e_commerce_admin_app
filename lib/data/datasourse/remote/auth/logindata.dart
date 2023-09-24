import '../../../../core/class/curd.dart';
import '../../../../core/constants/applinks.dart';

class LoginData {
  Crud crud = Crud();

  LoginData(this.crud);

  getData(String email, String password) async {
    var response = await crud.postData(AppLinks.login, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }

  resendCode(String email) async {
    var response = await crud.postData(AppLinks.resendcode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
