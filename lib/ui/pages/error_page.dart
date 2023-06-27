import 'package:flutter/material.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/generated/l10n.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return Scaffold(
      backgroundColor: ColorValue.background,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.deepPurple,
        ),
        title: Text(
          lang.error,
          style: const TextStyle(color: Colors.deepPurple),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
        centerTitle: true,
        backgroundColor: ColorValue.appBar,
        scrolledUnderElevation: 0.0,
      ),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Text(
            errorText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}
