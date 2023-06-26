import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/components/interrupt_game_dialog.dart';
import 'package:marble_game/ui/levels/level_1.dart';
import 'package:marble_game/ui/levels/level_2.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({super.key, required this.levelNumber});

  final int levelNumber;

  @override
  Widget build(BuildContext context) {
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
        ),
      ),
    );
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
