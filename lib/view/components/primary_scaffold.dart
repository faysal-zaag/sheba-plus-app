import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';
import 'package:sheba_plus/view/components/custom_appbar.dart';
import 'package:sheba_plus/view/home/widgets/drawer/home_drawer.dart';

class PrimaryScaffold extends StatelessWidget {
  final Widget body;
  final bool displayCenter;
  final bool userIcon;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget? bottomNavigationBar;

  const PrimaryScaffold({
    super.key,
    required this.body,
    this.displayCenter = false,
    this.userIcon = false,
    this.backgroundColor = AppColors.background,
    this.resizeToAvoidBottomInset = false, this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: CustomAppBar(
          displayCenter: displayCenter,
          userIcon: userIcon,
        ),
        drawer: HomeDrawer(),
        backgroundColor: backgroundColor,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
