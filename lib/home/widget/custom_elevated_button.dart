import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  VoidCallback onPressed;

  Widget child;
  Color? backGroundColor;
  Color? borderColorSide;

  CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backGroundColor,
    this.borderColorSide,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backGroundColor ?? AppColors.mainColor,
        padding: EdgeInsets.symmetric(vertical: height * 0.02),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        side: BorderSide(
          color: borderColorSide ?? AppColors.transparentColor,
          width: 1,
        ),
      ),
      onPressed: () {},
      child: child,
    );
  }
}
