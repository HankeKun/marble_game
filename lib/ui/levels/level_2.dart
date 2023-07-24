import 'package:flame/game.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/coin_component.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/spike_ball_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class Level2 extends Level {
  @override
  Future onLoad() async {
    await super.onLoad();

    await cameraWorld.addAll([
      GoalComponent(
        position: Vector2(size.x - size.y * 0.11, size.y * 0.11),
      ),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
        assetString: ImageName.footBall,
      ),
      SpikeBallComponent(
        position: size / 2,
        radius: size.y * 0.10,
      ),
      CoinComponent(
        position: Vector2(
          size.x / 2,
          size.y / 2 - size.y * 0.10 - size.y * 0.06 - size.y * 0.04,
        ),
      ),
    ]);
  }
}
