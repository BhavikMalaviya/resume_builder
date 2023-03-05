import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:resume_builder/utils/app_colors.dart';
import 'package:resume_builder/utils/sizebox.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final String? leadingIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final Color? color;
  final Color? bgcolor;
  final RxString errorMessage;
  final String? isSuffixText;
  final bool isSuffix;
  final TextEditingController? controller;
  final VoidCallback? suffixOnTap;
  final Widget? prefixIcon;
  final double? radius;
  final int? multiLine;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextField({
    Key? key,
    this.hintText,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.leadingIcon,
    this.suffixIcon,
    this.color,
    this.bgcolor,
    this.controller,
    this.suffixOnTap,
    this.isSuffix = false,
    this.isSuffixText,
    this.prefixIcon,
    this.radius,
    this.multiLine,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hSizedBox4,
        Obx(
          () => TextFormField(
            controller: controller,
            cursorColor: AppColors.primaryColor,
            style: const TextStyle(),
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            maxLines: multiLine ?? 1,
            decoration: InputDecoration(
              filled: true,
              prefixIcon: prefixIcon,
              // fillColor: bgcolor ?? AppColors.textFiledColor,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: errorMessage.isNotEmpty
                      ? AppColors.redColor
                      : AppColors.borderColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: errorMessage.isNotEmpty
                      ? AppColors.redColor
                      : AppColors.borderColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: errorMessage.isNotEmpty
                      ? AppColors.redColor
                      : AppColors.borderColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        Obx(
          () => errorMessage.isEmpty
              ? hSizedBox14
              : Container(
                  margin: const EdgeInsets.only(top: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "*${errorMessage.value}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.redColor,
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
