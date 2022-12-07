import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
  static showToast({msg, success = true}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: success ? Colors.green : Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
