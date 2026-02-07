import 'package:evently_app/home/tabs/home/widget/tab_widget.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddEvent extends StatefulWidget {
  AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  List<String> eventNamesList = [];

  int selectedIndex = 0;

  List<String> eventImagesLightList = [
    AppAssets.light_sport,
    AppAssets.light_birthday,
    AppAssets.light_meeting,
    AppAssets.light_book_club,
    AppAssets.light_exhibition,
  ];
  List<String> eventImagesDarkList = [
    AppAssets.dark_sport,
    AppAssets.dark_birthday,
    AppAssets.dark_meeting,
    AppAssets.dark_book_club,
    AppAssets.dark_exhibition,
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    eventNamesList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.02,
          ),
          child: Column(
            spacing: height * 0.02,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: themeProvider.isDarkMode()
                          ? AppColors.fillColor
                          : AppColors.whiteColor,
                      border: Border.all(
                        color: themeProvider.isDarkMode()
                            ? AppColors.strokeDarkColor
                            : AppColors.strokeWhiteColor,
                        width: 2,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        //todo: navigate to homeScreen
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 25,
                        color: themeProvider.isDarkMode()
                            ? AppColors.whiteColor
                            : AppColors.mainColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.add_event,
                      textAlign: TextAlign.center,
                      style: themeProvider.isDarkMode()
                          ? AppStyle.meduim18White
                          : AppStyle.meduim18Black,
                    ),
                  ),
                ],
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: themeProvider.isDarkMode()
                        ? AppColors.strokeDarkColor
                        : AppColors.strokeWhiteColor,
                    width: 2,
                  ),
                ),
                child: Image.asset(
                  themeProvider.isDarkMode()
                      ? eventImagesDarkList[selectedIndex]
                      : eventImagesLightList[selectedIndex],
                ),
              ),
              SizedBox(
                height: height * 0.05,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        selectedIndex = index;
                        setState(() {});
                      },
                      child: TabWidget(
                        isSelected: selectedIndex == index,
                        selectedColor: themeProvider.isDarkMode()
                            ? AppColors.mainDarkColor
                            : AppColors.mainColor,
                        unSelectedColor: themeProvider.isDarkMode()
                            ? AppColors.fillColor
                            : AppColors.whiteColor,
                        unSelectedBorderColor: themeProvider.isDarkMode()
                            ? AppColors.strokeDarkColor
                            : AppColors.strokeWhiteColor,
                        eventName: eventNamesList[index],
                        selectedTextStyle: AppStyle.meduim16White,
                        unSelectedTextStyle: themeProvider.isDarkMode()
                            ? AppStyle.meduim16White
                            : AppStyle.meduim16Black,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width * 0.008);
                  },
                  itemCount: eventNamesList.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
