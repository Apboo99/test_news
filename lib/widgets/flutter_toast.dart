import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


toastInfo({
  required String message,
}) {
  return Fluttertoast.showToast(
      msg: message,
      textColor:  Colors.black,
      backgroundColor: Colors.redAccent.withOpacity(.11),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      fontSize: 18);
}