import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/get_it/get_it.dart';
import 'package:marble_game/services/database.dart';
import 'package:marble_game/ui/game_components/ball_component.dart';

class CoinComponent extends BodyComponent with ContactCallbacks {
  late final Database _database = getIt.get<Database>();
  final Vector2 _position;
  late final double _radius = gameRef.size.y * 0.04;
  final SpriteAnimationComponent _sprite = SpriteAnimationComponent();

  CoinComponent({required Vector2 position})
      : _position = position,
        super(
          priority: -1,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    renderBody = false;

    _sprite
      ..size = Vector2.all(_radius * 2)
      ..anchor = Anchor.center
      ..animation = SpriteAnimation([
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin1), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin2), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin3), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin4), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin5), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin6), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin7), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin8), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin9), 0.1),
        SpriteAnimationFrame(await gameRef.loadSprite(ImageName.coin10), 0.1),
      ]);

    add(_sprite);
  }

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
      removeFromParent();
      _database.countCoinsUp();
    }
  }
}
