import 'dart:async';

import 'package:flame/camera.dart' as cam;
import 'package:flame/components.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';
import 'package:marble_game/ui/game_components/border.dart';
import 'package:marble_game/ui/game_components/goal_component.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';

class Level1 extends Forge2DGame with HasCollisionDetection {
  final _cameraWorld = cam.World();
  late final CameraComponent _cameraComponent;

  Level1() : super(gravity: Vector2(0, 0));

  @override
  Future onLoad() async {
    await super.onLoad();
    _cameraComponent = CameraComponent(world: _cameraWorld);
    _cameraComponent.viewfinder.anchor = Anchor.topLeft;

    await addAll([_cameraComponent, _cameraWorld]);

    await _cameraWorld.addAll([
      ...createBorder(game: this),
      GoalComponent(
        position: Vector2(size.x - size.y * 0.11, size.y * 0.11),
      ),
      BallComponent(
        startPosition: Vector2(size.y * 0.09, size.y - size.y * 0.09),
      ),
      WallComponent(
        halfXSize: size.x * 0.025,
        halfYSize: size.y * 0.2,
        centerOfWall: Vector2(size.x / 2, size.y * 0.2),
        angleOfWall: 0,
      ),
      WallComponent(
        halfXSize: size.x * 0.025,
        halfYSize: size.y * 0.2,
        centerOfWall: Vector2(size.x / 2, size.y - size.y * 0.2),
        angleOfWall: 0,
      ),
    ]);
  }
}
