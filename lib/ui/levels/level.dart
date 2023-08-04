import 'package:flame/camera.dart' as cam;
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/game_components/border.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_11.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_12.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_13.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_14.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_15.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_16.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_17.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_18.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_19.dart';
import 'package:marble_game/ui/levels/levels_11_20/level_20.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_1.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_10.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_2.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_3.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_4.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_5.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_6.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_7.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_8.dart';
import 'package:marble_game/ui/levels/levels_1_10/level_9.dart';

class Level extends Forge2DGame with HasCollisionDetection {
  late final CameraComponent _cameraComponent;
  final cameraWorld = cam.World();

  Level() : super(gravity: Vector2(0, 0));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _cameraComponent = CameraComponent(world: cameraWorld);
    _cameraComponent.viewfinder.anchor = Anchor.topLeft;

    await addAll([_cameraComponent, cameraWorld]);

    cameraWorld.addAll(createBorder(game: this));
  }

  static int actualNumberOfLevel = 20;

  static Game getGameByLevelNumber(int levelNumber) {
    final lang = S.current;

    return switch (levelNumber) {
      1 => Level1(),
      2 => Level2(),
      3 => Level3(),
      4 => Level4(),
      5 => Level5(),
      6 => Level6(),
      7 => Level7(),
      8 => Level8(),
      9 => Level9(),
      10 => Level10(),
      11 => Level11(),
      12 => Level12(),
      13 => Level13(),
      14 => Level14(),
      15 => Level15(),
      16 => Level16(),
      17 => Level17(),
      18 => Level18(),
      19 => Level19(),
      20 => Level20(),
      _ => throw UnimplementedError(lang.errorLevelDoesNotExist),
    };
  }
}
