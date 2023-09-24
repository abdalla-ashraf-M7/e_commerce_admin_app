import 'dart:convert';
import 'dart:io';
import 'package:admin_ecommerce/core/class/requeststatus.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import '../functions/checkinternet.dart';

String _basicAuth = 'Basic ${base64Encode(utf8.encode('dddd:sdfsdfsdfsdfdsf'))}';
Map<String, String> _myheaders = {
  //'content-type': 'application/json',
  //'accept': 'application/json',
  'authorization': _basicAuth,
};

class Crud {
  Future<Either<requeststatus, Map>> postData(String url, Map data) async {
    try {
      if (await checkINternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        /* print("%%%%%%%%%%%%%%%%%%%%%%%");
        print(response.body);
        print("%%%%%%%%%%%%%%%%%%%%%%%"); */
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          print("############InCrud#####Status Code: ${response.statusCode}");
          return left(requeststatus.serverFailaur);
        }
      } else {
        return left(requeststatus.offlineFailaur);
      }
    } catch (e) {
      print("%%%%%%%%%%%%%%%%%%%%%%%");
      print(e);
      return left(requeststatus.unknown);
    }
  }

  Future<Either<requeststatus, Map>> addRequestWithImageOne(url, data, File? image, [String? namerequest]) async {
    if (namerequest == null) {
      namerequest = "files";
    }

    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(_myheaders);

    if (image != null) {
      var length = await image.length();
      var stream = http.ByteStream(image.openRead());
      stream.cast();
      var multipartFile = http.MultipartFile(namerequest, stream, length, filename: basename(image.path));
      request.files.add(multipartFile);
    }

    // add Data to request
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    // add Data to request
    // Send Request
    var myrequest = await request.send();
    // For get Response Body
    var response = await http.Response.fromStream(myrequest);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map responsebody = jsonDecode(response.body);
      return Right(responsebody);
    } else {
      return const Left(requeststatus.serverFailaur);
    }
  }
}
