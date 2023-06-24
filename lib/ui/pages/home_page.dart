import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/route_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/services/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isMusicCheckboxWorking = false;
  bool _isSoundCheckboxWorking = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    Database database = context.watch();

    return Scaffold(
      backgroundColor: ColorValue.backgroundPurple,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                lang.gameName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.deepPurple),
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
                      // TODO: add game
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CheckboxMenuButton(
                    value: database.getMusicBool(),
                    onChanged: (_) async {
                      if (!_isMusicCheckboxWorking) {
                        _isMusicCheckboxWorking = true;
                        await database.toggleMusicBool();
                        _isMusicCheckboxWorking = false;
                      }
                    },
                    child: Text(
                      lang.music,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  CheckboxMenuButton(
                    value: database.getSoundBool(),
                    onChanged: (_) async {
                      if (!_isSoundCheckboxWorking) {
                        _isSoundCheckboxWorking = true;
                        await database.toggleSoundBool();
                        _isSoundCheckboxWorking = false;
                      }
                    },
                    child: Text(
                      lang.sound,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
