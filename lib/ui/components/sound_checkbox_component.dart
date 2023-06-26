import 'package:flutter/material.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/services/database.dart';
import 'package:provider/provider.dart';

class SoundCheckboxComponent extends StatefulWidget {
  const SoundCheckboxComponent({super.key});

  @override
  State<SoundCheckboxComponent> createState() => _SoundCheckboxComponentState();
}

class _SoundCheckboxComponentState extends State<SoundCheckboxComponent> {
  bool _isMusicCheckboxWorking = false;
  bool _isSoundCheckboxWorking = false;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    Database database = context.watch();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        CheckboxMenuButton(
          value: database.getMusicBool,
          onChanged: (_) async {
            if (!_isMusicCheckboxWorking) {
              _isMusicCheckboxWorking = true;
              await database.toggleMusicBool();
              _isMusicCheckboxWorking = false;
            }
          },
          child: Text(
            lang.music,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
        const SizedBox(width: 8.0),
        CheckboxMenuButton(
          value: database.getSoundBool,
          onChanged: (_) async {
            if (!_isSoundCheckboxWorking) {
              _isSoundCheckboxWorking = true;
              await database.toggleSoundBool();
              _isSoundCheckboxWorking = false;
            }
          },
          child: Text(
            lang.sound,
            style: Theme.of(context).textTheme.bodyLarge,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
