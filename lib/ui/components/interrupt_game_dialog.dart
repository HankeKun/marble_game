import 'package:flutter/material.dart';
import 'package:marble_game/generated/l10n.dart';

class InterruptGameDialog extends StatelessWidget {
  const InterruptGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(lang.interruptedGame, style: TextStyle(color: theme.primaryColor)),
      content: Text(lang.progressNotSaved, style: TextStyle(color: theme.primaryColor)),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(lang.interrupt.toUpperCase()),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(lang.playOn.toUpperCase()),
        ),
      ],
    );
  }
}
