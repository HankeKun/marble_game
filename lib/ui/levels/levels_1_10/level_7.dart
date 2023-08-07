import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/spike_ball_component.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level7 extends Level {
  @override
  Future onLoad() async {
    await super.onLoad();

    await cameraWorld.addAll([
      GoalComponent(
        position: Vector2(size.x - size.y * 0.11, size.y * 0.11),
      ),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
      ),
      WallComponent(
        width: size.x * 0.44,
        height: size.y * 0.08,
        topCenterPosition: Vector2(size.x * 0.22, size.y * 0.5 - size.y * 0.04),
        angleOfWall: 0,
      ),
      WallComponent(
        width: size.x * 0.44,
        height: size.y * 0.08,
        topCenterPosition: Vector2(size.x - size.x * 0.22, size.y * 0.5 - size.y * 0.04),
        angleOfWall: 0,
      ),
      SpikeBallComponent(
        position: Vector2(size.x * 0.3, size.y * 0.25),
        radius: size.y * 0.08,
      ),
      CoinComponent(
        position: Vector2(size.x * 0.1, size.y * 0.25),
      ),
    ]);
  }
}
