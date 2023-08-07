import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/spinning_wall_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level8 extends Level {
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
      SpinningWallComponent(
        width: size.y * 0.06,
        height: size.y * 0.6,
        centerPosition: Vector2(size.x * 0.2, size.y * 0.5),
      ),
      SpinningWallComponent(
        width: size.y * 0.06,
        height: size.y * 0.6,
        centerPosition: Vector2(size.x * 0.7, size.y * 0.5),
      ),
      CoinComponent(
          position: Vector2(size.x * 0.45, size.y * 0.5),
      ),
    ]);
  }
}
