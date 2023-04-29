import 'package:get/get.dart';

class Validators {



  static String validatePhoneNumber(String? value) {
    RegExp phoneRegExp =  RegExp(r'[0-9]{10}$');
    if (value == null || value.isEmpty) {
      return 'phone_number_empty'.tr;
    } else {
      if (value.length < 10) return 'phone_number_length_error'.tr;
      if (value.length > 10) return 'phone_number_length_error'.tr;
      if(!phoneRegExp.hasMatch(value)) return 'phone_number_regex_error'.tr;
      return '';
    }
  }

  static String validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password_empty'.tr;
    } else {
      if (value.length < 8) return 'password_length_error'.tr;
      return '';
    }
  }

  static String validateConfirmPassword(String? value , String password) {
    if (value == null || value.isEmpty) {
      return 'password_confirm_empty'.tr;
    } else {
      if (value.length < 8) return 'password_confirm_length_error'.tr;
      if(value != password) return 'password_and_confirm_mismatch'.tr;
      return '';
    }
  }

  static String validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'title_empty'.tr;
    } else {
      if (value.length < 8) return 'title_length_error'.tr;
      return '';
    }
  }

  static String validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'description_empty'.tr;
    } else {
      if (value.length < 16) return 'description_length_error'.tr;
      return '';
    }
  }


  static String validatePrice(String? value) {
    RegExp phoneRegExp =  RegExp(r'[0-9]+$');
    if (value == null || value.isEmpty) {
      return 'price_empty'.tr;
    } else {
      if(!phoneRegExp.hasMatch(value)) return 'price_regex_error'.tr;
      return '';
    }
  }


}
