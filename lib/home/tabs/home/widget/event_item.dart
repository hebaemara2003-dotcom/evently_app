import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/app_theme_provider.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.04),
      height: height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: themeProvider.isDarkMode()
              ? AssetImage(AppAssets.dark_birthday)
              : AssetImage(AppAssets.light_birthday),
        ),
        border: Border.all(color: Theme.of(context).dividerColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.02,
          vertical: height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.01,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: themeProvider.isDarkMode()
                      ? AppColors.strokeDarkColor
                      : AppColors.strokeWhiteColor,
                  width: 2,
                ),
                color: themeProvider.isDarkMode()
                    ? AppColors.PrimaryDarkColor
                    : AppColors.whiteBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '21 Jan',
                style: themeProvider.isDarkMode()
                    ? AppStyle.semi16MainDarkColor
                    : AppStyle.semi16MainColor,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.04),
              decoration: BoxDecoration(
                border: Border.all(
                  color: themeProvider.isDarkMode()
                      ? AppColors.strokeDarkColor
                      : AppColors.strokeWhiteColor,
                  width: 2,
                ),
                color: themeProvider.isDarkMode()
                    ? AppColors.PrimaryDarkColor
                    : AppColors.whiteBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'This is a Birthday Party',
                    style: themeProvider.isDarkMode()
                        ? AppStyle.meduim14White
                        : AppStyle.meduim14Black,
                  ),
                  IconButton(
                    onPressed: () {
                      //todo : add to favorite
                    },
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      size: 25,
                      color: themeProvider.isDarkMode()
                          ? AppColors.mainDarkColor
                          : AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
