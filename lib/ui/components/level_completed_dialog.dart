import 'package:flutter/material.dart';
import 'package:marble_game/generated/l10n.dart';

class LevelCompletedDialog extends StatelessWidget {
  const LevelCompletedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return AlertDialog(
      title: Text(lang.completedLevel, style: const TextStyle(color: Colors.deepPurple)),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(lang.back.toUpperCase()),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(lang.nextLevel.toUpperCase()),
        ),
      ],
    );
  }
}
