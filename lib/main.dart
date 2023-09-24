import 'package:admin_ecommerce/core/bindings/bindings.dart';
import 'package:admin_ecommerce/core/localization/changelocal.dart';
import 'package:admin_ecommerce/core/localization/translation.dart';
import 'package:admin_ecommerce/core/services/services.dart';
import 'package:admin_ecommerce/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.put(LanguageController());
    return GetMaterialApp(
      initialBinding: MyBindigs(),
      translations: MyTranslations(),
      locale: languageController.langauge,
      debugShowCheckedModeBanner: false,
      getPages: routes,
      theme: languageController.apptheme,
    );
  }
}
