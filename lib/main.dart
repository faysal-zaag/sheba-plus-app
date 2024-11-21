import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sheba_plus/bindings.dart';
import 'package:sheba_plus/utils/constant/app_theme.dart';
import 'package:sheba_plus/utils/routes/routers.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:toastification/toastification.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sheba Plus',
        theme: AppTheme.lightTheme,
        getPages: AppRouters.routes,
        initialRoute: Routes.splash,
        initialBinding: MyBindings(),
      ),
    );
  }
}
