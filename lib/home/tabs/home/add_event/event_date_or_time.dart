import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDateOrTime extends StatelessWidget {
  Widget iconeDateOrTime;

  String eventDateOrTime;

  VoidCallback onChooseDataOrTime;

  String chooseDataOrTime;

  EventDateOrTime({
    super.key,
    required this.iconeDateOrTime,
    required this.eventDateOrTime,
    required this.onChooseDataOrTime,
    required this.chooseDataOrTime,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Row(
      spacing: width * 0.04,
      children: [
        iconeDateOrTime,
        Text(
          eventDateOrTime,
          style: themeProvider.isDarkMode()
              ? AppStyle.meduim16White
              : AppStyle.meduim16Black,
        ),
        Spacer(),
        TextButton(
          onPressed: onChooseDataOrTime,
          child: Text(
            chooseDataOrTime,
            style: themeProvider.isDarkMode()
                ? AppStyle.regular14MainDarkColor
                : AppStyle.regular14MainColor,
          ),
        ),
      ],
    );
  }
}
