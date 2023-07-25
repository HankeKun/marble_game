import 'package:flutter/material.dart';
import 'package:marble_game/generated/l10n.dart';

class PurchaseBallDialog extends StatelessWidget {
  const PurchaseBallDialog({super.key, required this.coins});

  final int coins;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return AlertDialog(
      title: Text(
        lang.buyBall,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.deepPurple),
      ),
      content: Text(lang.buyBallForAmount(coins), style: const TextStyle(color: Colors.deepPurple)),
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
