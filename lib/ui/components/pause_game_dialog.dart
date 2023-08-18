import 'package:flutter/material.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/components/sound_checkbox_component.dart';

class PauseGameDialog extends StatelessWidget {
  const PauseGameDialog({super.key, required this.resetLevel});

  final Function resetLevel;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.secondaryHeaderColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: SoundCheckboxComponent(isDark: true),
          ),
        ),
        AlertDialog(
          title: Text(lang.pause, style: TextStyle(color: theme.primaryColor)),
          content: Text(lang.interruptGameNotSaved, style: TextStyle(color: theme.primaryColor)),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(lang.interruptGame.toUpperCase()),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, false);
                resetLevel();
              },
              child: Text(lang.retry.toUpperCase()),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(lang.playOn.toUpperCase()),
            ),
          ],
        ),
      ],
    );
  }
}
