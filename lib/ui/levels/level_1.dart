import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flutter/material.dart';

class Level1 extends FlameGame {
  @override
  FutureOr<void> onLoad() async {
    print(size);
    print(size.length2);
    addAll([
      RectangleComponent(size: Vector2(5, size.y), position: Vector2(0, 0), paint: BasicPalette.brown.paint()),
      RectangleComponent(size: Vector2(size.x, 5), position: Vector2(0, 0), paint: BasicPalette.brown.paint()),
      RectangleComponent(size: Vector2(5, size.y), position: size, anchor: Anchor.bottomRight, paint: BasicPalette.brown.paint()),
      RectangleComponent(size: Vector2(size.x, 5), position: size, anchor: Anchor.bottomRight, paint: BasicPalette.brown.paint()),
      CircleComponent(radius: 25, anchor: Anchor.center, position: size / 2),
    ]);
  }
}
