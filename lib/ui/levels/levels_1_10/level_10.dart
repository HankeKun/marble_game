import 'dart:math';

import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level10 extends Level {
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
        width: size.x * 0.4,
        height: size.y * 0.07,
        topCenterPosition: Vector2(size.x * 0.3, size.y * 0.3),
        angleOfWall: pi / 4,
      ),
      WallComponent(
        width: size.x * 0.4,
        height: size.y * 0.07,
        topCenterPosition: Vector2(size.x * 0.7, size.y * 0.6),
        angleOfWall: pi / 4,
      ),
      CoinComponent(
        position: Vector2(size.x * 0.92, size.y * 0.88),
      ),
    ]);
  }
}
