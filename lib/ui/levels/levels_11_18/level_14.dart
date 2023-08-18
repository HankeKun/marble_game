import 'package:flame/game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/spike_ball_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level14 extends Level {
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
        position: Vector2(size.x * 0.45, size.y * 0.35),
        radius: size.y * 0.10,
      ),
      SpikeBallComponent(
        position: Vector2(size.x * 0.65, size.y * 0.5),
        radius: size.y * 0.10,
      ),
      SpikeBallComponent(
        position: Vector2(size.x * 0.88, size.y * 0.8),
        radius: size.y * 0.10,
      ),
      SpikeBallComponent(
        position: Vector2(size.x * 0.7, size.y * 0.2),
        radius: size.y * 0.10,
      ),
      SpikeBallComponent(
        position: Vector2(size.x * 0.92, size.y * 0.37),
        radius: size.y * 0.10,
      ),
      CoinComponent(
        position: Vector2(size.x * 0.55, size.y * 0.2),
      ),
    ]);
  }
}
