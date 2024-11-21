import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final Color? color;
  final double? size;
  const CustomLoader({super.key, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      size: size ?? 50.0,
      color: color ?? AppColors.primary,
    );
  }
}
