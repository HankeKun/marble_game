import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/route_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/components/sound_checkbox_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return Scaffold(
      backgroundColor: ColorValue.background,
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
                      context.goNamed(RouteName.levelSelection);
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
              const SoundCheckboxComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
