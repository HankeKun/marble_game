import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/route_name.dart';
import 'package:marble_game/services/database.dart';
import 'package:provider/provider.dart';

class LevelComponent extends StatelessWidget {
  const LevelComponent({super.key, required this.levelNumber});

  final int levelNumber;

  @override
  Widget build(BuildContext context) {
    Database database = context.watch();

    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: database.getActualLevel < levelNumber ? null : () => context.goNamed(RouteName.level, extra: levelNumber),
      child: Ink(
        decoration: BoxDecoration(
          color: _getLevelColor(database.getActualLevel),
          border: Border.all(
            width: 3.0,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        width: 100,
        height: 100,
        child: Center(
          child: Text(
            levelNumber.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.deepPurple),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }

  Color _getLevelColor(int actualLevel) {
    if (actualLevel < levelNumber) {
      return ColorValue.lockedLevel;
    } else if (actualLevel > levelNumber) {
      return ColorValue.completedLevel;
    }
    return ColorValue.actualLevel;
  }
}
