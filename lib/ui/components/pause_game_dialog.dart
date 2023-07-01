import 'package:flutter/material.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/components/sound_checkbox_component.dart';

class PauseGameDialog extends StatelessWidget {
  const PauseGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorValue.background,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: SoundCheckboxComponent(),
          ),
        ),
        AlertDialog(
          title: Text(lang.pause, style: const TextStyle(color: Colors.deepPurple)),
          content: Text(lang.interruptGameNotSaved, style: const TextStyle(color: Colors.deepPurple)),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(lang.interruptGame.toUpperCase()),
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
