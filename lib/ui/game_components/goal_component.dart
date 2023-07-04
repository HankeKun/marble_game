import 'dart:math';

import 'package:flame/palette.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:marble_game/constants/overlay_name.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';

class GoalComponent extends BodyComponent with ContactCallbacks {
  late final double _radius = gameRef.size.y * 0.08;
  late BallComponent _ballComponent;
  bool _contactToBall = false;
  final Vector2 _position;

  GoalComponent({required Vector2 position})
      : _position = position, super(
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
      position: _position,
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is BallComponent) {
      _ballComponent = other;
      _contactToBall = true;
    }
  }

  @override
  void endContact(Object other, Contact contact) {
    super.endContact(other, contact);
    _contactToBall = false;
  }

  @override
  void update(double dt) {
    super.update(dt);
    if(_contactToBall && isBallFullyInsideGoal()) {
      _ballComponent.removeFromParent();
      gameRef.overlays.add(OverlayName.levelCompleted);
    }
  }

  bool isBallFullyInsideGoal() {
    final differenceX = (_ballComponent.body.position.x - body.position.x).abs();
    final differenceY = (_ballComponent.body.position.y - body.position.y).abs();

    final distance = sqrt(pow(differenceX, 2) + pow(differenceY, 2)) + _ballComponent.radius;

    return distance <= _radius + gameRef.size.y * 0.005;
  }
}
