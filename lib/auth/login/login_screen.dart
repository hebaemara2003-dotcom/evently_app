import 'package:evently_app/home/widget/custom_text_feild.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/utils/app_assets.dart';
import 'package:evently_app/utils/app_colors.dart';
import 'package:evently_app/utils/app_routes.dart';
import 'package:evently_app/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/widget/custom_elevated_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.transparentColor,
        title: Image.asset(
          themeProvider.isDarkMode()
              ? AppAssets.evently_dark
              : AppAssets.evently_light,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * .02,
          vertical: height * 0.04,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: height * 0.03,
            children: [
              Text(
                AppLocalizations.of(context)!.login_to_your_account,
                style: Theme.of(context).textTheme.labelLarge,
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
              InkWell(
                onTap: () {},
                child: Text(
                  'Forget Password?',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.mainDarkColor,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColors.mainDarkColor,
                    decorationThickness: 2,
                  ),
                ),
              ),
              CustomElevatedButton(
                onPressed: login,
                child: Text(
                  AppLocalizations.of(context)!.login,
                  style: AppStyle.meduim20White,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${AppLocalizations.of(context)!.do_not_have_an_account}?",
                    style: AppStyle.regular14Gray,
                  ),
                  TextButton(
                    onPressed: () {
                      //todo: navigate to register screen
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(AppRoutes.registerRouteName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.sign_up,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        decorationColor: AppColors.mainColor,
                        decoration: TextDecoration.underline,
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
                      thickness: 2,
                      indent: width * 0.04,
                      endIndent: width * 0.07,
                    ),
                  ),
                ],
              ),
              CustomElevatedButton(
                backGroundColor: AppColors.whiteColor,
                borderColorSide: AppColors.strokeWhiteColor,
                onPressed: login,
                child: Row(
                  spacing: width * 0.03,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.google_image),
                    Text(
                      AppLocalizations.of(context)!.login_with_google,
                      style: AppStyle.meduim18MainWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    //todo: login
  }
}
