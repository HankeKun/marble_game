import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';

List<WallComponent> createBorder({required Forge2DGame game, Paint? color}) {
  return [
    WallComponent(
      width: game.size.x,
      height: game.size.y * 0.01,
      topCenterPosition: Vector2(game.size.x / 2, 0),
      angleOfWall: 0.0,
    ),
    WallComponent(
      width: game.size.x,
      height: game.size.y * 0.01,
      topCenterPosition: Vector2(game.size.x / 2, game.size.y - game.size.y * 0.01),
      angleOfWall: 0.0,
    ),
    WallComponent(
      width: game.size.y * 0.01,
      height: game.size.y,
      topCenterPosition: Vector2(game.size.y * 0.005, 0),
      angleOfWall: 0.0,
    ),
    WallComponent(
      width: game.size.y * 0.01,
      height: game.size.y,
      topCenterPosition: Vector2(game.size.x - game.size.y * 0.005, 0),
      angleOfWall: 0.0,
    ),
  ];
}
