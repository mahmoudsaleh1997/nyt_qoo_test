

import 'package:flutter/material.dart';
import '../../widget/app_text_widget.dart';
import 'package:get/get.dart';
getErrorWidget(String key, error){
  return PrivacyPolicyErrorWidget(error: error,);
}

class PrivacyPolicyErrorWidget extends StatelessWidget {
  PrivacyPolicyErrorWidget({
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Center(
        child: AppTextWidget(
          title: error,
        ),
      ),
    );
  }
}

