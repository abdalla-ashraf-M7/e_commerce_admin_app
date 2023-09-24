import '../../../../core/class/curd.dart';
import '../../../../core/constants/applinks.dart';

class NotificationsData {
  Crud crud = Crud();

  NotificationsData(this.crud);

  sendNotify(String title, String body, String time, String who) async {
    var response = await crud.postData(AppLinks.notifications, {
      "title": title,
      "body": body,
      "time": time,
      "who": who,
    });
    return response.fold((l) => l, (r) => r);
  }
}
