import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class WallComponent extends BodyComponent {
  Anchor? anchor;
  Vector2? position;
  Vector2? size;

  WallComponent(
    this.anchor,
    this.position,
    this.size, {
    Iterable<Component>? children,
    Paint? color,
    int? priority,
    bool? renderBody,
  }) : super(
          children: children,
          paint: color ?? BasicPalette.brown.paint(),
          priority: priority,
          renderBody: renderBody ?? true,
        );

  @override
  Body createBody() {
    final shape = EdgeShape()/*..set(v1, v2)*/;

    final fixtureDef = FixtureDef(shape);

    final bodyDef = BodyDef(
      userData: this,
      position: position,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
