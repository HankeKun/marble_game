import 'package:flutter/material.dart';
import 'package:marble_game/generated/l10n.dart';

class PurchaseBallDialog extends StatelessWidget {
  const PurchaseBallDialog({super.key, required this.coins});

  final int coins;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(
        lang.buyBall,
        textAlign: TextAlign.center,
        style: TextStyle(color: theme.primaryColor),
      ),
      content: Text(lang.buyBallForAmount(coins), style: TextStyle(color: theme.primaryColor)),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(lang.cancel.toUpperCase()),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(lang.buy.toUpperCase()),
        ),
      ],
    );
  }
}
