import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/spinning_wall_component.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level9 extends Level {
  @override
  Future onLoad() async {
    await super.onLoad();

    await cameraWorld.addAll([
      GoalComponent(
        position: Vector2(size.x - size.y * 0.11, size.y * 0.11),
      ),
      GoalComponent(
        position: Vector2(size.y * 0.11, size.y * 0.11),
      ),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
      ),
      WallComponent(
        width: size.x * 0.4,
        height: size.y * 0.07,
        topCenterPosition: Vector2(size.x * 0.2, size.y * 0.25),
        angleOfWall: 0,
      ),
      WallComponent(
        width: size.x * 0.4,
        height: size.y * 0.07,
        topCenterPosition: Vector2(size.x * 0.8, size.y * 0.25),
        angleOfWall: 0,
      ),
      SpinningWallComponent(
        width: size.y * 0.07,
        height: size.y * 0.45,
        centerPosition: size / 2,
      ),
      CoinComponent(
        position: Vector2(size.x * 0.15, size.y * 0.11),
      ),
      CoinComponent(
        position: Vector2(size.x * 0.85, size.y * 0.11),
      ),
    ]);
  }
}
