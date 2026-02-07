import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_colors.dart';

class SettingsItem extends StatelessWidget {
  String text;

  Widget item;

  SettingsItem({super.key, required this.text, required this.item});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * .01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: themeProvider.isDarkMode()
            ? AppColors.transparentColor
            : AppColors.strokeWhiteColor,
        border: Border.all(
          color: themeProvider.isDarkMode()
              ? AppColors.strokeDarkColor
              : AppColors.lightGrayColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: Theme.of(context).textTheme.headlineSmall),
          item,
        ],
      ),
    );
  }
}
