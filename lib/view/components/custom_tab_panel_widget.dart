import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:sheba_plus/utils/constant/app_colors.dart';

class CustomTabPanel extends StatelessWidget {
  final List<String> tabPanelList;
  final Function(String) changeTabPanel;
  final String selectedPanel;
  final bool fullBorder;
  final Color? borderColor;
  final bool? small;
  final List<int>? flexRatio;

  const CustomTabPanel(
      {super.key,
      required this.tabPanelList,
      required this.changeTabPanel,
      required this.selectedPanel,
      required this.fullBorder,
      this.borderColor,
      this.small,
      this.flexRatio});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...tabPanelList.mapIndexed((index, option) => Expanded(
              flex: flexRatio?[index] ?? 1,
              child: GestureDetector(
                onTap: () {
                  changeTabPanel(option);
                },
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: selectedPanel == option
                                  ? fullBorder
                                      ? Theme.of(context).primaryColor
                                      : Colors.transparent
                                  : fullBorder
                                      ? AppColors.neutral70
                                      : Colors.transparent,
                              width: selectedPanel == option
                                  ? fullBorder
                                      ? 3
                                      : 2
                                  : 1),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          option,
                          style: selectedPanel == option
                              ? Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: fullBorder
                                      ? Theme.of(context).primaryColor
                                      : AppColors.grey,
                                  fontSize: small == true ? 12 : 16)
                              : Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.grey,
                                  fontSize: small == true ? 12 : 16),
                        ),
                      ),
                    ),
                    if (fullBorder == false)
                      Opacity(
                        opacity: selectedPanel == option ? 1 : 0,
                        child: Container(
                          height: 2,
                          width: 50,
                          color: AppColors.neutral70,
                        ),
                      )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
