import 'package:flutter/material.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/components/level_component.dart';
import 'package:marble_game/ui/levels/level.dart';

class LevelSelectionPage extends StatefulWidget {
  const LevelSelectionPage({super.key});

  @override
  State<LevelSelectionPage> createState() => _LevelSelectionPageState();
}

class _LevelSelectionPageState extends State<LevelSelectionPage> {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return Scaffold(
      backgroundColor: ColorValue.background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorValue.lightText,
        ),
        title: Text(
          lang.levelSelection,
          style: TextStyle(color: ColorValue.lightText),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
        centerTitle: true,
        backgroundColor: ColorValue.appBar,
        scrolledUnderElevation: 0.0,
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      for (int i = 1; i <= Level.actualNumberOfLevel; i++) LevelComponent(levelNumber: i),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
