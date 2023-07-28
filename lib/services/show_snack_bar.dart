import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class ShowSnackBar {
  final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();

  void showSnackbar(String text) {
    snackBarKey.currentState?.hideCurrentSnackBar();
    snackBarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text),
        showCloseIcon: true,
      ),
    );
  }
}
