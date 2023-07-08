import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/constants/overlay_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/services/database.dart';
import 'package:marble_game/ui/components/game_over_dialog.dart';
import 'package:marble_game/ui/components/interrupt_game_dialog.dart';
import 'package:marble_game/ui/components/level_completed_dialog.dart';
import 'package:marble_game/ui/components/pause_game_dialog.dart';
import 'package:marble_game/ui/levels/level.dart';
import 'package:marble_game/ui/pages/error_page.dart';
import 'package:provider/provider.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key, required this.levelNumber});

  final int levelNumber;

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  late int levelNumber;

  @override
  void initState() {
    super.initState();
    levelNumber = widget.levelNumber;
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    Database database = context.watch();

    try {
      return Scaffold(
        backgroundColor: ColorValue.background,
        body: SafeArea(
          bottom: false,
          child: GameWidget(
            game: Level.getGameByLevelNumber(levelNumber),
            loadingBuilder: (context) => Container(
              color: ColorValue.background,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            backgroundBuilder: (context) => Container(color: ColorValue.background),
            errorBuilder: (context, game) => ErrorPage(errorText: lang.errorLoadingLevel),
            overlayBuilderMap: {
              OverlayName.pauseButton: (context, game) => WillPopScope(
                    onWillPop: () async {
                      (game as Game).pauseEngine();
                      final value = await showDialog(
                        context: context,
                        builder: (context) => const InterruptGameDialog(),
                        barrierDismissible: false,
                      );
                      game.resumeEngine();
                      return value;
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: IconButton(
                        icon: const Icon(Icons.pause),
                        onPressed: () async {
                          (game as Game).pauseEngine();
                          final shouldLeave = await showDialog(
                            context: context,
                            builder: (context) => PauseGameDialog(
                              resetLevel: () {
                                setState(() {});
                              },
                            ),
                            barrierDismissible: false,
                          );
                          if (shouldLeave && context.mounted) {
                            context.pop();
                          }
                          game.resumeEngine();
                        },
                      ),
                    ),
                  ),
              OverlayName.levelCompleted: (context, game) => LevelCompletedDialog(
                    levelNumber: levelNumber,
                    nextLevel: () {
                      setState(() {
                        levelNumber++;
                      });
                    },
                  ),
              OverlayName.gameOver: (context, game) => GameOverDialog(
                    resetLevel: () {
                      setState(() {});
                    },
                  ),
              OverlayName.coinsCount: (context, game) => Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/${ImageName.coin1}",
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          database.getCoinsCount.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.deepPurple),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ],
                    ),
                  ),
            },
            initialActiveOverlays: const [
              OverlayName.pauseButton,
              OverlayName.coinsCount,
            ],
          ),
        ),
      );
    } on UnimplementedError catch (e) {
      return ErrorPage(errorText: e.message!);
    }
  }
}
