import 'package:flame/game.dart';
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
      ),
      WallComponent(
        halfXSize: size.x / 2 - size.y * 0.10,
        halfYSize: size.y * 0.04,
        centerOfWall: Vector2(size.x / 2 - size.y * 0.10, size.y * 0.25),
        angleOfWall: 0,
      ),
      WallComponent(
        halfXSize: size.x / 2 - size.y * 0.10,
        halfYSize: size.y * 0.04,
        centerOfWall: Vector2(size.x / 2 + size.y * 0.10, size.y * 0.50),
        angleOfWall: 0,
      ),
      WallComponent(
        halfXSize: size.x / 2 - size.y * 0.10,
        halfYSize: size.y * 0.04,
        centerOfWall: Vector2(size.x / 2 - size.y * 0.10, size.y * 0.75),
        angleOfWall: 0,
      ),
      CoinComponent(
        position: Vector2(size.x * 0.20, size.y * 0.11),
      ),
    ]);
  }
}
