import 'package:evently_app/home/widget/custom_text_feild.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../home/widget/event_item.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            height: height * 0.18,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              color: themeProvider.isDarkMode()
                  ? AppColors.transparentColor
                  : AppColors.mainColor,
            ),
            child: CustomTextFeild(
              filled: themeProvider.isDarkMode() ? false : true,
              fillColor: AppColors.whiteColor,
              borderColor: themeProvider.isDarkMode()
                  ? AppColors.strokeDarkColor
                  : AppColors.strokeWhiteColor,
              hintText: AppLocalizations.of(context)!.search_for_event,
              hintStyle: AppStyle.regular14Gray,
              suffixIcon: Icon(
                Icons.search_outlined,
                size: 25,
                color: themeProvider.isDarkMode()
                    ? AppColors.mainDarkColor
                    : AppColors.mainColor,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              // padding: EdgeInsets.only(
              //   top: height*0.01
              // ),
              itemBuilder: (context, index) {
                return EventItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: height * 0.02);
              },
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
