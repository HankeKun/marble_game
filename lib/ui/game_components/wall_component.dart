import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class WallComponent extends BodyComponent {
  double halfXSize;
  double halfYSize;
  Vector2 centerOfWall;
  double angleOfWall;

  WallComponent({
    required this.halfXSize,
    required this.halfYSize,
    required this.centerOfWall,
    required this.angleOfWall,
    Iterable<Component>? children,
    Paint? color,
    int? priority,
  }) : super(
          children: children,
          paint: color ?? BasicPalette.brown.paint(),
          priority: priority,
        );

  @override
  Body createBody() {
    final shape = PolygonShape()..setAsBox(halfXSize, halfYSize, centerOfWall, angleOfWall);

    final fixtureDef = FixtureDef(
      shape,
      density: 2000.0,
    );

    final bodyDef = BodyDef(
      userData: this,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
