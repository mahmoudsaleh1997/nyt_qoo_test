

import 'package:flutter/material.dart';
import '../../widget/app_text_widget.dart';
import 'package:get/get.dart';
getErrorWidget(String key, error){
  return DefaultErrorWidget(error: error,);
}

class DefaultErrorWidget extends StatelessWidget {
  DefaultErrorWidget({
    required this.error,
  });

  final String error;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: AppTextWidget(
        title: error,
      ),
    );
  }
}

