import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/app_colors.dart';
import '../core/constants.dart';

class CustomSearchInputField extends StatelessWidget {
  final double height;
  final double? width;
  final TextEditingController searchController;
  final Function(String?) onSubmit;

  const CustomSearchInputField({
    required this.height,
    required this.searchController,
    required this.onSubmit,
    this.width,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: AppColors.white,
      ),
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          cursorColor: AppColors.gold,
          decoration: InputDecoration(
            icon: SizedBox(
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                AppConstants.searchIcon,
                color: AppColors.grey,
              ),
            ),
            border: InputBorder.none,
          ),
          textInputAction: TextInputAction.search,
          controller: searchController,
          onFieldSubmitted: onSubmit,
        ),
      ),
    );
  }
}
