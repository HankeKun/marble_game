import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/spike_ball_component.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level16 extends Level {
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
      SpikeBallComponent(
        position: Vector2(size.x * 0.2, size.y * 0.7),
        radius: size.y * 0.10,
      ),
      SpikeBallComponent(
        position: Vector2(size.x * 0.7, size.y * 0.3),
        radius: size.y * 0.10,
      ),
      SpikeBallComponent(
        position: Vector2(size.x * 0.76, size.y * 0.84),
        radius: size.y * 0.10,
      ),
      WallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        topCenterPosition: Vector2(size.x * 0.2, size.y * 0.2),
        angleOfWall: 0,
      ),
      WallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        topCenterPosition: Vector2(size.x * 0.5, size.y * 0.7),
        angleOfWall: 0,
      ),
      WallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        topCenterPosition: Vector2(size.x * 0.45, size.y * 0.1),
        angleOfWall: 0,
      ),
      WallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        topCenterPosition: Vector2(size.x * 0.9, size.y * 0.45),
        angleOfWall: 0,
      ),
      CoinComponent(
        position: Vector2(size.x * 0.92, size.y * 0.92),
      ),
    ]);
  }
}
