import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:marble_game/ui/game_components/border_component.dart';

class BallComponent extends CircleComponent
    with HasGameRef, CollisionCallbacks {

  Vector2 startPosition;

  BallComponent({required this.startPosition})
      : super(
          anchor: Anchor.center,
          position: startPosition,
          paint: BasicPalette.darkGreen.paint(),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    radius = gameRef.size.y * 0.06;
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (position.x - radius > 0 && position.x + radius < gameRef.size.x) {
      position.x += 2;
    }
    if (position.y - radius > 0 && position.y + radius < gameRef.size.y) {
      position.y += 0;
    }
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is BorderComponent) {
      print('COLLISION Border');
    }
    if (other is RectangleComponent) {
      print('COLLISION Rectangle');
    }
  }
}
