import 'dart:async';

import 'package:flame/components.dart';

class BorderComponent extends RectangleComponent {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // [
    //   RectangleComponent(
    //     size: Vector2(gameRef.size.y * 0.01, gameRef.size.y),
    //     position: Vector2(0, 0),
    //     paint: BasicPalette.brown.paint(),
    //   ),
    //   RectangleComponent(
    //     size: Vector2(gameRef.size.x, gameRef.size.y * 0.01),
    //     position: Vector2(0, 0),
    //     paint: BasicPalette.brown.paint(),
    //   ),
    //   RectangleComponent(
    //     size: Vector2(gameRef.size.y * 0.01, gameRef.size.y),
    //     position: gameRef.size,
    //     anchor: Anchor.bottomRight,
    //     paint: BasicPalette.brown.paint(),
    //   ),
    //   RectangleComponent(
    //     size: Vector2(gameRef.size.x, gameRef.size.y * 0.01),
    //     position: gameRef.size,
    //     anchor: Anchor.bottomRight,
    //     paint: BasicPalette.brown.paint(),
    //   ),
    // ];
  }
}
