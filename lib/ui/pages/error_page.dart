import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/generated/l10n.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: ColorValue.background,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lang.error,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(color: theme.primaryColor),
              ),
              const SizedBox(height: 8.0),
              Text(
                errorText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: theme.primaryColor),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: context.pop,
                child: Text(lang.back.toUpperCase()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
