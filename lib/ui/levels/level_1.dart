import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/foundation.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/border_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';

class Level1 extends FlameGame with HasCollisionDetection {
  @override
  bool get debugMode => kDebugMode;

  @override
  Future onLoad() async {
    await super.onLoad();
    // throw Exception();
    // await Future.delayed(const Duration(seconds: 3));
    await addAll([
      BorderComponent(),
      GoalComponent(
        position: Vector2(size.x - size.y * 0.11, size.y * 0.11),
      ),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
      ),
      RectangleComponent(
        anchor: Anchor.topCenter,
        position: Vector2(size.x / 2, 0),
        size: Vector2(size.x * 0.05, size.y * 0.4),
        paint: BasicPalette.brown.paint(),
      ),
      RectangleComponent(
        anchor: Anchor.bottomCenter,
        position: Vector2(size.x / 2, size.y),
        size: Vector2(size.x * 0.05, size.y * 0.4),
        paint: BasicPalette.brown.paint(),
      ),
    ]);
  }
}
