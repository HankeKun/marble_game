import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:marble_game/constants/overlay_name.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';

class SpikeBallComponent extends BodyComponent with ContactCallbacks {
  final Vector2 _position;
  final double _radius;

  SpikeBallComponent({required Vector2 position, required double radius})
      : _radius = radius,
        _position = position,
        super(
          priority: -1,
          paint: BasicPalette.red.paint(),
        );

  @override
  Body createBody() {
    final shape = CircleShape()..radius = _radius;

    final fixtureDef = FixtureDef(
      shape,
      density: 1000.0,
    );

    final bodyDef = BodyDef(
      userData: this,
      position: _position,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is BallComponent) {
      other.removeFromParent();
      gameRef.overlays.add(OverlayName.gameOver);
    }
  }
}
