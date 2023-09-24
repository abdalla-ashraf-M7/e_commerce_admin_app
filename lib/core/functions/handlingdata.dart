import '../class/requeststatus.dart';

handlingData(response) {
  if (response is requeststatus) {
    return response;
  } else {
    return requeststatus.success;
  }
}
