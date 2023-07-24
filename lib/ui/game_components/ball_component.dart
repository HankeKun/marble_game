import 'package:flame/components.dart';
import 'package:flame/palette.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:marble_game/constants/music_name.dart';
import 'package:marble_game/get_it/get_it.dart';
import 'package:marble_game/services/database.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';
import 'package:sensors_plus/sensors_plus.dart';

class BallComponent extends BodyComponent with ContactCallbacks {
  late final Database _database = getIt.get<Database>();
  final SpriteComponent _sprite = SpriteComponent();
  final Vector2 _startPosition;
  final String _assetString;

  late final double radius = gameRef.size.y * 0.06;

  BallComponent({required Vector2 startPosition, required String assetString})
      : _startPosition = startPosition,
        _assetString = assetString,
        super(
          paint: BasicPalette.darkGreen.paint(),
        );

  @override
  Body createBody() {
    final shape = CircleShape()..radius = radius;

    final fixtureDef = FixtureDef(
      shape,
      density: 1.0,
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

    renderBody = false;
    _sprite
      ..sprite = await gameRef.loadSprite(_assetString)
      ..size = Vector2.all(radius * 2)
      ..anchor = Anchor.center;

    add(_sprite);

    accelerometerEvents.listen((event) {
      body.linearVelocity = Vector2(event.y, event.x) * 0.8;
    });
  }

  @override
  void beginContact(Object other, Contact contact) {
    super.beginContact(other, contact);
    if (other is WallComponent && _database.getSoundBool) {
      FlameAudio.play(MusicName.marbleDrop);
    }
  }
}
