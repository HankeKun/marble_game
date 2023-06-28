import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class WallComponent extends RectangleComponent with CollisionCallbacks {
  WallComponent({
    Anchor? anchor,
    double? angle,
    Iterable<Component>? children,
    List<Paint>? paintLayers,
    Paint? color,
    Vector2? position,
    int? priority,
    Vector2? size,
  }) : super(
          anchor: anchor,
          angle: angle,
          children: children,
          paint: color ?? BasicPalette.brown.paint(),
          paintLayers: paintLayers,
          position: position,
          priority: priority,
          size: size,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await add(RectangleHitbox());
  }
}
