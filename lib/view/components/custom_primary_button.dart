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
  final VoidCallback onClick;
  final Color? borderColor;
  final Color? labelColor;
  final bool? loading;
  final bool? small;
  final Widget? icon;

  const CustomPrimaryButton({
    super.key,
    required this.label,
    required this.onClick,
    this.fontSize,
    this.small,
    this.height = 52,
    this.width,
    this.color,
    this.borderColor,
    this.labelColor,
    this.loading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width ?? double.infinity,
      child: MaterialButton(
        onPressed: loading == true ? null : onClick,
        color: color ?? AppColors.primary,
        disabledColor: color?.withOpacity(0.5) ?? AppColors.primary.withOpacity(0.5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.circularRadius4,
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        child: loading == true
            ? const CustomLoader(
          size: 30,
          color: AppColors.white,
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: icon,
              ),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize ?? 16,
                color: labelColor ?? AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
