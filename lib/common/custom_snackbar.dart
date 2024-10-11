import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackbar(BuildContext context, String message,
      {Color backgroundColor = Colors.green, int durationSeconds = 3}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      backgroundColor: backgroundColor, // Custom background color
      duration: Duration(seconds: durationSeconds), // Custom duration
      behavior:
          SnackBarBehavior.floating, // Makes the SnackBar float over the UI
      margin:
          const EdgeInsets.all(16), // Margin to add space around the SnackBar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
