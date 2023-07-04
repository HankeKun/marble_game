import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:marble_game/ui/game_components/wall_component.dart';

List<WallComponent> createBorder({required Forge2DGame game, Paint? color}) {
  return [
    WallComponent(
      halfXSize: game.size.x / 2,
      halfYSize: game.size.y * 0.005,
      centerOfWall: Vector2(game.size.x / 2, game.size.y * 0.005),
      angleOfWall: 0.0,
    ),
    WallComponent(
      halfXSize: game.size.x / 2,
      halfYSize: game.size.y * 0.005,
      centerOfWall: Vector2(game.size.x / 2, game.size.y - game.size.y * 0.005),
      angleOfWall: 0.0,
    ),
    WallComponent(
      halfXSize: game.size.y * 0.005,
      halfYSize: game.size.y / 2,
      centerOfWall: Vector2(game.size.y * 0.005, game.size.y / 2),
      angleOfWall: 0.0,
    ),
    WallComponent(
      halfXSize: game.size.y * 0.005,
      halfYSize: game.size.y / 2,
      centerOfWall: Vector2(game.size.x - game.size.y * 0.005, game.size.y / 2),
      angleOfWall: 0.0,
    ),
  ];
}
