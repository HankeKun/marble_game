import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class WallComponent extends BodyComponent {
  final double _halfXSize;
  final double _halfYSize;
  final Vector2 _centerOfWall;
  final double _angleOfWall;

  WallComponent({
    required double halfXSize,
    required double halfYSize,
    required Vector2 centerOfWall,
    required double angleOfWall,
    Iterable<Component>? children,
    Paint? color,
    int? priority,
  }) : _angleOfWall = angleOfWall, _centerOfWall = centerOfWall, _halfYSize = halfYSize, _halfXSize = halfXSize, super(
          children: children,
          paint: color ?? BasicPalette.brown.paint(),
          priority: priority,
        );

  @override
  Body createBody() {
    final shape = PolygonShape()..setAsBox(_halfXSize, _halfYSize, _centerOfWall, _angleOfWall);

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
