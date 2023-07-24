import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class WallComponent extends BodyComponent {
  final double _height;
  final double _width;
  final Vector2 _topCenterPosition;
  final double _angleOfWall;

  WallComponent({
    required double width,
    required double height,
    required Vector2 topCenterPosition,
    required double angleOfWall,
    Iterable<Component>? children,
    Paint? color,
    int? priority,
  })  : _angleOfWall = angleOfWall,
        _topCenterPosition = topCenterPosition,
        _width = width,
        _height = height,
        super(
          children: children,
          paint: color ?? BasicPalette.brown.paint(),
          priority: priority,
        );

  @override
  Body createBody() {
    final shape = PolygonShape()
      ..setAsBox(
        _width / 2,
        _height / 2,
        Vector2(_topCenterPosition.x, _topCenterPosition.y + _height / 2),
        _angleOfWall,
      );

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
