import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';

class TabWidget extends StatelessWidget {
  bool isSelected;
  String eventName;

  Color selectedColor;
  Color unSelectedColor;
  Color unSelectedBorderColor;
  TextStyle selectedTextStyle;
  TextStyle unSelectedTextStyle;

  TabWidget({
    super.key,
    required this.isSelected,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.unSelectedBorderColor,
    required this.eventName,
    required this.selectedTextStyle,
    required this.unSelectedTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.02),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: height * .005,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? selectedColor : unSelectedColor,
        border: Border.all(
          color: isSelected
              ? AppColors.transparentColor
              : unSelectedBorderColor,
          width: 2,
        ),
      ),
      child: Text(
        eventName,
        style: isSelected ? selectedTextStyle : unSelectedTextStyle,
      ),
    );
  }
}
