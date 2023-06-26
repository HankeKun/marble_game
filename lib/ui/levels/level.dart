import 'package:flame/game.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/levels/level_1.dart';
import 'package:marble_game/ui/levels/level_2.dart';

class Level {
  static int actualNumberOfLevel = 2;

  static Game getGameByLevelNumber(int levelNumber) {
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
