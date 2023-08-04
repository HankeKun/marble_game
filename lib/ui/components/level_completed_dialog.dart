import 'package:flame_lottie/flame_lottie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/services/database.dart';
import 'package:marble_game/ui/levels/level.dart';
import 'package:provider/provider.dart';

class LevelCompletedDialog extends StatefulWidget {
  const LevelCompletedDialog({super.key, required this.levelNumber, required this.nextLevel});

  final int levelNumber;
  final Function nextLevel;

  @override
  State<LevelCompletedDialog> createState() => _LevelCompletedDialogState();
}

class _LevelCompletedDialogState extends State<LevelCompletedDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lang = S.of(context);
      final theme = Theme.of(context);

      showDialog(
        context: context,
        builder: (context) => Stack(
          children: [
            Center(
              child: LottieBuilder.asset(
                ImageName.winningAnimation,
              ),
            ),
            AlertDialog(
              title: Text(
                lang.completedLevel,
                textAlign: TextAlign.center,
                style: TextStyle(color: theme.primaryColor),
              ),
              actionsAlignment: widget.levelNumber < Level.actualNumberOfLevel
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.pop();
                  },
                  child: Text(lang.back.toUpperCase()),
                ),
                if (widget.levelNumber < Level.actualNumberOfLevel)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      widget.nextLevel();
                    },
                    child: Text(lang.nextLevel.toUpperCase()),
                  ),
              ],
            ),
          ],
        ),
        barrierDismissible: false,
      );
      context.read<Database>().setActualLevel(widget.levelNumber + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
