import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:marble_game/constants/music_name.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';
import 'package:sensors_plus/sensors_plus.dart';

class BallComponent extends BodyComponent with ContactCallbacks {
  late final Vector2 _acceleration = Vector2.zero();
  final Vector2 _startPosition;

  late final double radius = gameRef.size.y * 0.06;

  BallComponent({required Vector2 startPosition})
      : _startPosition = startPosition,
        super(
          paint: BasicPalette.darkGreen.paint(),
        );

  @override
  Body createBody() {
    final shape = CircleShape()..radius = radius;

    final fixtureDef = FixtureDef(
      shape,
      density: 1.0,
      restitution: 0.05,
    );

    final bodyDef = BodyDef(
      userData: this,
      type: BodyType.dynamic,
      position: _startPosition,
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

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is WallComponent) {
      print("Play sound");
      FlameAudio.play(MusicName.marbleDrop); // TODO: sound check, edit sound
    }
  }
}
