import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:device_preview/device_preview.dart'; // Add device_preview package
import 'package:sheba_plus/bindings.dart';
import 'package:sheba_plus/controllers/firebase_controller.dart';
import 'package:sheba_plus/firebase_options.dart';
import 'package:sheba_plus/utils/constant/app_language.dart';
import 'package:sheba_plus/utils/constant/app_theme.dart';
import 'package:sheba_plus/utils/routes/routers.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/utils/utils.dart';
import 'package:sheba_plus/view/global_texts.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseController().initNotifications();
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
        locale: Utils.getInitialLocal(),
        translations: AppLanguage(),
        fallbackLocale: const Locale('en', 'UK'),
        title: GlobalTexts.appName,
        theme: AppTheme.lightTheme,
        getPages: AppRouters.routes,
        initialRoute: Routes.splash,
        builder: DevicePreview.appBuilder,
      ),
    );
  }
}
