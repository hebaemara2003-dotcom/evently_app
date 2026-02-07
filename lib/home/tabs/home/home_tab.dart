import 'package:evently_app/home/tabs/home/widget/event_item.dart';
import 'package:evently_app/home/tabs/home/widget/tab_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> eventsNameList = [];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workShop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode()
            ? AppColors.transparentColor
            : AppColors.mainColor,
        title: Column(
          spacing: height * 0.01,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.welcome_back,
              style: AppStyle.regular14WhiteColor,
            ),
            Text("Route Academy", style: AppStyle.meduim20White),
          ],
        ),
        actions: [
          Icon(
            themeProvider.isDarkMode()
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
            color: themeProvider.isDarkMode()
                ? AppColors.mainDarkColor
                : AppColors.whiteColor,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.02),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.01,
              vertical: height * 0.001,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: themeProvider.isDarkMode()
                  ? AppColors.mainDarkColor
                  : AppColors.transparentColor,
              border: Border.all(
                color: themeProvider.isDarkMode()
                    ? AppColors.transparentColor
                    : AppColors.whiteColor,
                width: 2,
              ),
            ),
            child: Text(
              languageProvider.appLanguage.toUpperCase(),
              style: AppStyle.semi14White,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height * .15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              color: themeProvider.isDarkMode()
                  ? AppColors.transparentColor
                  : AppColors.mainColor,
            ),
            child: DefaultTabController(
              length: eventsNameList.length,
              child: TabBar(
                isScrollable: true,
                dividerColor: AppColors.transparentColor,
                indicatorColor: AppColors.transparentColor,
                labelPadding: EdgeInsets.zero,
                tabAlignment: TabAlignment.start,
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: eventsNameList.map((eventName) {
                  return TabWidget(
                    isSelected:
                        selectedIndex == eventsNameList.indexOf(eventName),
                    selectedColor: themeProvider.isDarkMode()
                        ? AppColors.mainDarkColor
                        : AppColors.whiteColor,
                    unSelectedColor: AppColors.transparentColor,
                    unSelectedBorderColor: themeProvider.isDarkMode()
                        ? AppColors.mainColor
                        : AppColors.whiteColor,
                    eventName: eventName,
                    selectedTextStyle: themeProvider.isDarkMode()
                        ? AppStyle.meduim16White
                        : AppStyle.meduim16MainWhite,
                    unSelectedTextStyle: AppStyle.meduim16White,
                  );
                }).toList(),
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
