import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/controllers/global_controller.dart';
import 'package:sheba_plus/data/services/storage_service.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/utils/routes/routes.dart';
import 'package:sheba_plus/view/auth/controller/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final storageService = Get.find<StorageService>();
  final authController = Get.find<AuthController>();
  final globalController = Get.find<GlobalController>();

  void _initCall() async {
    await globalController.getDefaultSetting();

    await authController.isAuthenticated(accessToken: storageService.getAuthToken());
    Get.offAndToNamed(Routes.home);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCall();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sheba +",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
          ],
        ),
      ),
    );
  }
}
