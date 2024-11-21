import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_border_radius.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/components/custom_loader.dart';

class CustomPrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final String label;
  final Color? color;
  final Function onClick;
  final Color? borderColor;
  final Color? labelColor;
  final bool? loading;
  final bool? small;
  final Widget? icon;

  const CustomPrimaryButton(
      {super.key,
      required this.label,
      required this.onClick,
      this.fontSize,
      this.small,
      this.height = 48,
      this.width,
      this.color,
      this.borderColor,
      this.labelColor,
      this.loading = false,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (loading == false) {
          onClick();
        }
      },
      child: Opacity(
        opacity: loading == true ? 0.5 : 1,
        child: Container(
          height: height,
          width: width ?? double.infinity,
          padding: EdgeInsets.symmetric(
              horizontal: small == true ? 12 : 24,
              vertical: small == true ? 4 : 8),
          decoration: BoxDecoration(
              color: color ?? AppColors.primary,
              borderRadius: AppBorderRadius.circularRadius2,
              border: Border.all(color: borderColor ?? Colors.transparent)),
          child: Center(
            child: loading == true
                ? const CustomLoader(
                    size: 30,
                    color: AppColors.white,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: icon == null ? 0 : 10),
                        child: icon,
                      ),
                      Text(
                        label,
                        style: TextStyle(
                          fontSize: fontSize ?? 14,
                          color: labelColor ?? AppColors.white,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
