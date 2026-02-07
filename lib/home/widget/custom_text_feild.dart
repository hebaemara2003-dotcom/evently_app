import 'package:evently_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  bool? filled;

  Color? fillColor;

  Color borderColor;

  Widget? prefixIcon;

  Widget? suffixIcon;

  String? hintText;

  TextStyle? hintStyle;

  String? lableText;

  TextStyle? lableStyle;
  int? maxLines;

  CustomTextFeild({
    super.key,
    this.filled,
    this.fillColor,
    required this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    this.lableText,
    this.lableStyle,
    this.maxLines
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
        enabledBorder: buildDecorationBorder(
          radius: 16,
          borderColor: borderColor,
        ),
        focusedBorder: buildDecorationBorder(
          radius: 16,
          borderColor: borderColor,
        ),
        errorBorder: buildDecorationBorder(
          radius: 16,
          borderColor: AppColors.redColor,
        ),
        focusedErrorBorder: buildDecorationBorder(
          radius: 16,
          borderColor: AppColors.redColor,
        ),
        filled: filled,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: lableText,
        labelStyle: lableStyle,
      ),
    );
  }

  OutlineInputBorder buildDecorationBorder({
    required double radius,
    required borderColor,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: borderColor, width: 2),
    );
  }
}
