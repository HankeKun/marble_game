import 'package:flame/components.dart';
import 'package:flame/palette.dart';

class GoalComponent extends CircleComponent with HasGameRef {
  GoalComponent({required position})
      : super(
          position: position,
          anchor: Anchor.center,
          priority: -1,
          paint: BasicPalette.black.paint(),
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    radius = gameRef.size.y * 0.08;
  }
}
