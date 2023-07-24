import 'dart:async';

import 'package:flame/components.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level1 extends Level {
  @override
  Future onLoad() async {
    await super.onLoad();

    await cameraWorld.addAll([
      GoalComponent(
        position: Vector2(size.x - size.y * 0.11, size.y * 0.11),
      ),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
        assetString: ImageName.volleyBall,
      ),
      WallComponent(
        width: size.x * 0.05,
        height: size.y * 0.4,
        topCenterPosition: Vector2(size.x / 2, 0),
        angleOfWall: 0,
      ),
      WallComponent(
        width: size.x * 0.05,
        height: size.y * 0.4,
        topCenterPosition: Vector2(size.x / 2, size.y - size.y * 0.4),
        angleOfWall: 0,
      ),
      CoinComponent(
        position: Vector2(
          size.x / 2 - size.x * 0.025 - size.y * 0.04 - size.y * 0.04,
          size.y * 0.04 + size.y * 0.01 + size.y * 0.04,
        ),
      ),
    ]);
  }
}
