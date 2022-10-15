import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AppDialogs {
  static Future showAlertDialog(
      {required BuildContext context, required String message}) async {
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(message),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Ok"),
                ),
              ],
            ));
  }

  static Future showToast({
    required String message,
    ToastGravity gravity = ToastGravity.BOTTOM,
  }) async {
    await Fluttertoast.showToast(
      msg: message,
      gravity: gravity,
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
