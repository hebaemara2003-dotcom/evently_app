import 'package:evently_app/home/tabs/profile/language/language_bottom_sheet.dart';
import 'package:evently_app/home/tabs/profile/theme/theme_bottom_sheet.dart';
import 'package:evently_app/home/tabs/profile/widget/settings_item.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.01),
        child: Column(
          spacing: height * 0.02,
          children: [
            Image.asset(AppAssets.route_logo),
            Text('Route Academy',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineLarge,),
            Text('routeAcademy@gmail.com',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,),
            SettingsItem(text: AppLocalizations.of(context)!.dark_mode,
                item: Switch(
                  value: isDark,
                  activeColor: AppColors.mainColor,
                  inactiveThumbColor: AppColors.lightGrayColor,
                  onChanged: (newValue) {
                    isDark = newValue;
                    //todo: changeTheme
                    themeProvider.chanageTheme(
                        isDark ? ThemeMode.dark :
                        ThemeMode.light
                    );
                    setState(() {

                    });
                  },
                )
            ),
            SettingsItem(text: AppLocalizations.of(context)!.language,
                item: IconButton(icon: Icon(Icons.arrow_forward_ios_outlined),
                  onPressed: () {
                    //todo: show language bottom sheet
                    showLanguageBottomSheet();
                  },
                  color: themeProvider.isDarkMode() ? AppColors.mainDarkColor :
                  AppColors.mainColor,)
            ),
            SettingsItem(text: AppLocalizations.of(context)!.logout,
                item: IconButton(icon: Icon(Icons.logout, size: 30,),
                    onPressed: () {
                      //todo: logout
                    },
                    color: AppColors.redColor)
              ),

            ],
          ),
        ),

    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context,
      builder: (context) => LanguageBottomSheet(),);
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(context: context,
      builder: (context) => ThemeBottomSheet(),);
  }
}
