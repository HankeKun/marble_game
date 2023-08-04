import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class SpinningWallComponent extends BodyComponent {
  final double _height;
  final double _width;
  final Vector2 _centerPosition;
  final double _angleOfWall;
  late double _angle = _angleOfWall;

  SpinningWallComponent({
    required double width,
    required double height,
    required Vector2 centerPosition,
    required double angleOfWall,
    Iterable<Component>? children,
    Paint? color,
    int? priority,
  })  : _angleOfWall = angleOfWall,
        _centerPosition = centerPosition,
        _width = width,
        _height = height,
        super(
          children: children,
          paint: color ?? BasicPalette.darkBlue.paint(),
          priority: priority,
        );

  @override
  void update(double dt) {
    super.update(dt);

    _angle += 2.5 * dt;
    _angle %= 2 * pi;
    body.setTransform(_centerPosition, -_angle);
  }

  @override
  Body createBody() {
    final shape = PolygonShape()
      ..setAsBox(
        _width / 2,
        _height / 2,
        Vector2.zero(),
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
