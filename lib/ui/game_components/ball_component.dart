import 'package:flame/components.dart';

class BallComponent extends CircleComponent with HasGameRef {
  Vector2 startPosition;

  BallComponent({required this.startPosition}) {
    anchor = Anchor.center;
    radius = gameRef.size.y * 0.06;
    position = startPosition;
  }
}
