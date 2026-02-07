import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        // spacing: height*0.04,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              //todo: change theme to dark
              themeProvider.chanageTheme(ThemeMode.dark);
            },
            child: themeProvider.isDarkMode()
                ? getSelectedItemWidget(
                    theme: AppLocalizations.of(context)!.dark,
                  )
                : getUnSelectedItemWidget(
                    theme: AppLocalizations.of(context)!.dark,
                  ),
          ),
          InkWell(
            onTap: () {
              //todo: change theme to light
              themeProvider.chanageTheme(ThemeMode.light);
            },
            child: !themeProvider.isDarkMode()
                ? getSelectedItemWidget(
                    theme: AppLocalizations.of(context)!.light,
                  )
                : getUnSelectedItemWidget(
                    theme: AppLocalizations.of(context)!.light,
                  ),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget({required String theme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(theme), Icon(Icons.check)],
    );
  }

  Widget getUnSelectedItemWidget({required String theme}) {
    return Text(theme);
  }
}
