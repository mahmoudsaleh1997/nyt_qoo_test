import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/app_colors.dart';

class CustomSearchInputField extends StatelessWidget {
  final double width, height;
  final Function(String) onChanged;
  final IconData? icon;
  final bool error, isPassword;
  final String errorText, hintText;
  final TextStyle? hintStyle, textStyle;
  final TextInputType textInputType;
  final bool? isGrey;
  final int? maxLength;

  const CustomSearchInputField(
      {required this.width,
      required this.height,
      required this.onChanged,
      this.icon,
      this.error = false,
      this.errorText = "",
      this.hintText = "",
      this.hintStyle,
      this.textInputType = TextInputType.text,
      this.maxLength,
      this.textStyle,
      this.isGrey = false,
      this.isPassword = false})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: !isGrey! ? AppColors.white : AppColors.greenAccent,
      ),
      width: width,
      height: height,
      child: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: onChanged,
            style: textStyle,
            decoration: InputDecoration(
              errorText: error ? errorText : null,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle,
              labelStyle: textStyle,
              prefixIcon: SizedBox(
                width: 10,
                height: 10,
                child: SvgPicture.asset(
                  'assets/icons/search.svg',
                  color: AppColors.grey,
                ),
              ),
              contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              counterText: "",
            ),
            maxLength: maxLength,
          ),
        ),
      ),
    );
  }
}
