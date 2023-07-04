import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level3 extends Level {
  @override
  Future onLoad() async {
    await super.onLoad();

    await cameraWorld.addAll([
      GoalComponent(
        position: Vector2(size.y * 0.09, size.y - size.y * 0.14),
      ),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
      ),
    ]);
  }
}
