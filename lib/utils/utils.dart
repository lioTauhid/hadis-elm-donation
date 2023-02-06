import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/color.dart';

class Utils {
  static final apiHeader = {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*'
  };

  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  static void hidePopup() {
    Get.back();
  }

  static void showSnackBar(String message) {
    Get.snackbar(
      "Information!",
      message,
      icon: Icon(Icons.error, color: Colors.indigo),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.lightBlue,
      borderRadius: 20,
      margin: EdgeInsets.only(right: 700),
      colorText: white,
      duration: Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static bool isPasswordValid(String password) {
    return password.length >= 6 ? true : false;
  }

  static bool isEmailValid(String email) {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regex.hasMatch(email);
  }

  static int incrementDecrement(bool increment, int val) {
    if (increment) {
      val++;
    } else {
      if (val > 0) {
        val--;
      }
    }
    return val;
  }
}
