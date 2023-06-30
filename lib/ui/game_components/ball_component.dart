import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:sensors_plus/sensors_plus.dart';

class BallComponent extends BodyComponent {
  late final double _radius = gameRef.size.y * 0.06;
  late final Vector2 _acceleration = Vector2.zero();
  Vector2 startPosition;

  BallComponent({required this.startPosition})
      : super(
          paint: BasicPalette.darkGreen.paint(),
        );

  @override
  Body createBody() {
    final shape = CircleShape()..radius = _radius;

    final fixtureDef = FixtureDef(
      shape,
      density: 1.0,
      restitution: 0.05,
    );

    final bodyDef = BodyDef(
      userData: this,
      type: BodyType.dynamic,
      position: startPosition,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    gyroscopeEvents.listen((GyroscopeEvent event) {
      _acceleration.add(Vector2(event.x, -event.y));
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
    body.applyForce(_acceleration);
  }
}
