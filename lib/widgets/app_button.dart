import 'package:flutter/material.dart';
import 'package:resume_builder/utils/app_colors.dart';

class AppButton extends StatelessWidget {
  final Color? buttonColor;
  final Color? textColor;
  final dynamic buttontext;
  final double? width;
  final double? height;
  final double? radius;
  final Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;
  const AppButton({
    Key? key,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.radius,
    this.onPressed,
    required this.buttontext,
    this.padding,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 15),
          ),
          elevation: 0,
          backgroundColor: buttonColor ?? AppColors.accentColor,
          padding: padding ?? EdgeInsets.zero,
        ),
        child: buttontext.runtimeType == String
            ? Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(
                  buttontext,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              )
            : buttontext,
      ),
    );
  }
}
