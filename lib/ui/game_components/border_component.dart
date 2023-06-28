import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class BorderComponent extends PositionComponent with HasGameRef, CollisionCallbacks {
  late Paint color;

  BorderComponent({Paint? color}) {
    this.color = color ?? BasicPalette.brown.paint();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await addAll([
      RectangleHitbox(
        size: Vector2(gameRef.size.y * 0.01, gameRef.size.y),
        position: Vector2(0, 0),
      ),
      RectangleHitbox(
        size: Vector2(gameRef.size.x, gameRef.size.y * 0.01),
        position: Vector2(0, 0),
      ),
      RectangleHitbox(
        size: Vector2(gameRef.size.y * 0.01, gameRef.size.y),
        position: gameRef.size,
        anchor: Anchor.bottomRight,
      ),
      RectangleHitbox(
        size: Vector2(gameRef.size.x, gameRef.size.y * 0.01),
        position: gameRef.size,
        anchor: Anchor.bottomRight,
      ),
      RectangleComponent(
        size: Vector2(gameRef.size.y * 0.01, gameRef.size.y),
        position: Vector2(0, 0),
        paint: color,
      ),
      RectangleComponent(
        size: Vector2(gameRef.size.x, gameRef.size.y * 0.01),
        position: Vector2(0, 0),
        paint: color,
      ),
      RectangleComponent(
        size: Vector2(gameRef.size.y * 0.01, gameRef.size.y),
        position: gameRef.size,
        anchor: Anchor.bottomRight,
        paint: color,
      ),
      RectangleComponent(
        size: Vector2(gameRef.size.x, gameRef.size.y * 0.01),
        position: gameRef.size,
        anchor: Anchor.bottomRight,
        paint: color,
      ),
    ]);
  }
}
