import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/overlay_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/components/interrupt_game_dialog.dart';
import 'package:marble_game/ui/components/pause_game_dialog.dart';
import 'package:marble_game/ui/levels/level_1.dart';
import 'package:marble_game/ui/levels/level_2.dart';
import 'package:marble_game/ui/pages/error_page.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key, required this.levelNumber});

  final int levelNumber;

  @override
  Widget build(BuildContext context) {
    try {
      return WillPopScope(
        onWillPop: () async {
          return await showDialog(
            context: context,
            builder: (context) => const InterruptGameDialog(),
            barrierDismissible: false,
          );
        },
        child: SafeArea(
          child: GameWidget(
            game: _getGameByLevelNumber(),
            backgroundBuilder: (context) => Container(color: ColorValue.background),
            overlayBuilderMap: {
              OverlayName.pauseButton: (context, game) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: IconButton(
                      icon: const Icon(Icons.pause),
                      onPressed: () async {
                        (game as Game).pauseEngine();
                        final shouldLeave = await showDialog(
                          context: context,
                          builder: (context) => const PauseGameDialog(),
                          barrierDismissible: false,
                        );
                        if (shouldLeave && context.mounted) {
                          context.pop();
                        }
                        game.resumeEngine();
                      },
                    ),
                  ),
            },
            initialActiveOverlays: const [
              OverlayName.pauseButton,
            ],
          ),
        ),
      );
    } on UnimplementedError catch (e) {
      return ErrorPage(errorText: e.message!);
    }
  }

  Game _getGameByLevelNumber() {
    final lang = S.current;

    switch (levelNumber) {
      case 1:
        return Level1();
      case 2:
        return Level2();
      default:
        throw UnimplementedError(lang.errorLevelDoesNotExist);
    }
  }
}
