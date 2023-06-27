import 'dart:async';

import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/border_component.dart';

class Level1 extends FlameGame {
  @override
  Future onLoad() async {
    await super.onLoad();
    // throw Exception();
    // await Future.delayed(const Duration(seconds: 3));
    await addAll([
      // BorderComponent(),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
      ),
    ]);
  }
}
