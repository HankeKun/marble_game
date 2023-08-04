import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/constants/music_name.dart';
import 'package:marble_game/constants/route_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/services/database.dart';
import 'package:marble_game/ui/components/coin_ui_component.dart';
import 'package:marble_game/ui/components/sound_checkbox_component.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FlameAudio.bgm.initialize();
    final isMusicOn = context.read<Database>().getMusicBool;
    if (isMusicOn && !FlameAudio.bgm.isPlaying) {
      FlameAudio.bgm.play(MusicName.background);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageName.background),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                const CoinUiComponent(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      lang.gameName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(color: ColorValue.lightText),
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 400),
                        child: ElevatedButton(
                          child: Text(lang.play.toUpperCase(), maxLines: 1, overflow: TextOverflow.fade),
                          onPressed: () {
                            context.goNamed(RouteName.levelSelection);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 325),
                        child: ElevatedButton(
                          child: Text(lang.shop.toUpperCase(), maxLines: 1, overflow: TextOverflow.fade),
                          onPressed: () {
                            context.goNamed(RouteName.shop);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 250),
                        child: ElevatedButton(
                          child: Text(lang.about, maxLines: 1, overflow: TextOverflow.fade),
                          onPressed: () {
                            context.goNamed(RouteName.about);
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const SoundCheckboxComponent(isDark: false),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
