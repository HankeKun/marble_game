import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class SpinningWallComponent extends BodyComponent {
  final double _height;
  final double _width;
  final Vector2 _centerPosition;
  double _angleOfWall = 0;

  SpinningWallComponent({
    required double width,
    required double height,
    required Vector2 centerPosition,
    Iterable<Component>? children,
    Paint? color,
    int? priority,
  })  : _centerPosition = centerPosition,
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

    _angleOfWall += 2.5 * dt;
    _angleOfWall %= 2 * pi;
    body.setTransform(_centerPosition, -_angleOfWall);
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
