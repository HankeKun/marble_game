import 'package:flame/camera.dart' as cam;
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/game_components/border.dart';
import 'package:marble_game/ui/levels/level_1.dart';
import 'package:marble_game/ui/levels/level_2.dart';

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
