import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/spinning_wall_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level6 extends Level {
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
        width: size.x * 0.07,
        height: size.x * 0.07,
        centerPosition: Vector2(size.x * 0.08, size.y * 0.7),
      ),
      SpinningWallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        centerPosition: Vector2(size.x * 0.34, size.y * 0.85),
      ),
      SpinningWallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        centerPosition: Vector2(size.x * 0.27, size.y * 0.3),
      ),
      SpinningWallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        centerPosition: Vector2(size.x * 0.6, size.y * 0.22),
      ),
      SpinningWallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        centerPosition: Vector2(size.x * 0.6, size.y * 0.22),
      ),
      SpinningWallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        centerPosition: Vector2(size.x * 0.62, size.y * 0.7),
      ),
      SpinningWallComponent(
        width: size.x * 0.07,
        height: size.x * 0.07,
        centerPosition: Vector2(size.x * 0.84, size.y * 0.6),
      ),
      CoinComponent(
        position: Vector2(size.x * 0.27, size.y * 0.1),
      ),
      CoinComponent(
        position: Vector2(size.x * 0.90, size.y * 0.85),
      ),
    ]);
  }
}
