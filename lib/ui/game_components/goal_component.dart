import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class GoalComponent extends BodyComponent {
  late final double _radius = gameRef.size.y * 0.08;
  Vector2 position;

  GoalComponent({required this.position})
      : super(
          priority: -1,
          paint: BasicPalette.black.paint(),
        );

  @override
  Body createBody() {
    final shape = CircleShape()..radius = _radius;

    final fixtureDef = FixtureDef(
      shape,
      isSensor: true,
    );

    final bodyDef = BodyDef(
      userData: this,
      position: position,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
