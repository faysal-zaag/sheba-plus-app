import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart'; // Add device_preview package
import 'package:sheba_plus/bindings.dart';
import 'package:sheba_plus/utils/constant/app_theme.dart';
import 'package:sheba_plus/utils/routes/routers.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:toastification/toastification.dart';

void main() async {
  await GetStorage.init();
  runApp(
    kIsWeb
        ? DevicePreview(
            enabled: true,
            builder: (context) => const MyApp(),
          )
        : const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: MyBindings(),
        title: 'Sheba Plus',
        theme: AppTheme.lightTheme,
        getPages: AppRouters.routes,
        initialRoute: Routes.splash,
        builder: DevicePreview.appBuilder, // Add this for device preview
      ),
    );
  }
}
