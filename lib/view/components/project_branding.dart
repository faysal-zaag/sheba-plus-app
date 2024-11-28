import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class ProjectBranding extends StatelessWidget {
  final Color textColor;
  final TextStyle? textStyle;
  const ProjectBranding({super.key, this.textColor = AppColors.white, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Text("Sheba Plus", style: textStyle ?? Theme.of(context).textTheme.headlineSmall?.copyWith(color: textColor),);
  }
}
