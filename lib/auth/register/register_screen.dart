import 'package:evently_app/home/widget/custom_elevated_button.dart';
import 'package:evently_app/home/widget/custom_text_feild.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        centerTitle: true,
        title: Image.asset(
          themeProvider.isDarkMode()
              ? AppAssets.evently_dark
              : AppAssets.evently_light,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .04,
          vertical: height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: height * 0.02,
          children: [
            Text(
              AppLocalizations.of(context)!.create_your_account,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextFeild(
              filled: themeProvider.isDarkMode() ? false : true,
              fillColor: AppColors.whiteColor,
              borderColor: themeProvider.isDarkMode()
                  ? AppColors.mainColor
                  : AppColors.strokeWhiteColor,
              prefixIcon: Icon(
                Icons.person_2_outlined,
                color: AppColors.lightGrayColor,
                size: 25,
              ),
              hintText: AppLocalizations.of(context)!.enter_your_name,
              hintStyle: AppStyle.regular14Gray,
            ),
            CustomTextFeild(
              filled: themeProvider.isDarkMode() ? false : true,
              fillColor: AppColors.whiteColor,
              borderColor: themeProvider.isDarkMode()
                  ? AppColors.mainColor
                  : AppColors.strokeWhiteColor,
              prefixIcon: Icon(
                Icons.mail_outline,
                color: AppColors.lightGrayColor,
                size: 25,
              ),
              hintText: AppLocalizations.of(context)!.please_enter_your_email,
              hintStyle: AppStyle.regular14Gray,
            ),
            CustomTextFeild(
              filled: themeProvider.isDarkMode() ? false : true,
              fillColor: AppColors.whiteColor,
              borderColor: themeProvider.isDarkMode()
                  ? AppColors.mainColor
                  : AppColors.strokeWhiteColor,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.lightGrayColor,
                size: 25,
              ),
              suffixIcon: Icon(Icons.visibility_off_outlined),
              hintText: AppLocalizations.of(context)!.inter_your_password,
              hintStyle: AppStyle.regular14Gray,
            ),
            CustomTextFeild(
              filled: themeProvider.isDarkMode() ? false : true,
              fillColor: AppColors.whiteColor,
              borderColor: themeProvider.isDarkMode()
                  ? AppColors.mainColor
                  : AppColors.strokeWhiteColor,
              prefixIcon: Icon(
                Icons.lock_outline,
                color: AppColors.lightGrayColor,
                size: 25,
              ),
              suffixIcon: Icon(Icons.visibility_off_outlined),
              hintText: AppLocalizations.of(context)!.please_enter_rePassword,
              hintStyle: AppStyle.regular14Gray,
            ),
            CustomElevatedButton(
              onPressed: () {
                //todo: sign up with google
              },
              child: Text(
                AppLocalizations.of(context)!.sign_up,
                style: AppStyle.meduim20White,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${AppLocalizations.of(context)!.already_have_account}?",
                  style: AppStyle.regular14Gray,
                ),
                TextButton(
                  onPressed: () {
                    //todo: navigate to login screen
                    Navigator.of(
                      context,
                    ).pushReplacementNamed(AppRoutes.loginRouteName);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.mainColor,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Theme.of(context)!.dividerColor,
                    thickness: 2,
                    indent: width * 0.02,
                    endIndent: width * 0.06,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.or,
                  style: AppStyle.meduim16MainWhite,
                ),
                Expanded(
                  child: Divider(
                    color: Theme.of(context).dividerColor,
                    thickness: 3,
                    indent: width * 0.04,
                    endIndent: width * 0.07,
                  ),
                ),
              ],
            ),
            CustomElevatedButton(
              backGroundColor: AppColors.whiteColor,
              borderColorSide: AppColors.strokeWhiteColor,
              onPressed: sign_up,
              child: Row(
                spacing: width * 0.03,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.google_image),
                  Text(
                    AppLocalizations.of(context)!.sign_up_with_google,
                    style: AppStyle.meduim18MainWhite,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sign_up() {
    //todo: sign up
  }
}
