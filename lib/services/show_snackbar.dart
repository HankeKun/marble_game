import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class ShowSnackbar {
  final GlobalKey<ScaffoldMessengerState> snackbarKey = GlobalKey<ScaffoldMessengerState>();

  void showSnackbar(String text) {
    snackbarKey.currentState?.hideCurrentSnackBar();
    snackbarKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(text),
        showCloseIcon: true,
      ),
    );
  }
}
