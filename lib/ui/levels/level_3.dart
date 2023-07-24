import 'package:flame/game.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level3 extends Level {
  @override
  Future onLoad() async {
    await super.onLoad();

    await cameraWorld.addAll([
      GoalComponent(
        position: Vector2(size.y * 0.11, size.y * 0.11),
      ),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
        assetString: ImageName.tennisBall,
      ),
      WallComponent(
        width: size.x - size.y * 0.10,
        height: size.y * 0.08,
        topCenterPosition: Vector2(size.x / 2 - size.y * 0.10, size.y * 0.21),
        angleOfWall: 0,
      ),
      WallComponent(
        width: size.x - size.y * 0.10,
        height: size.y * 0.08,
        topCenterPosition: Vector2(size.x / 2 + size.y * 0.10, size.y * 0.46),
        angleOfWall: 0,
      ),
      WallComponent(
        width: size.x - size.y * 0.10,
        height: size.y * 0.08,
        topCenterPosition: Vector2(size.x / 2 - size.y * 0.10, size.y * 0.71),
        angleOfWall: 0,
      ),
      CoinComponent(
        position: Vector2(size.x * 0.20, size.y * 0.11),
      ),
    ]);
  }
}
