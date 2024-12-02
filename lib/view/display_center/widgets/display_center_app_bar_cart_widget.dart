import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class DisplayCenterAppBarCartWidget extends StatelessWidget {
  const DisplayCenterAppBarCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/cart.svg'),
          Container(
            margin: const EdgeInsets.only(bottom: 20.0),
            padding: const EdgeInsets.all(3.0),
            decoration: const BoxDecoration(
                color: AppColors.white, shape: BoxShape.circle),
            child: Center(
              child: Text(
                '10',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
