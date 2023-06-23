import 'package:flutter/material.dart';
import 'package:marble_game/service/database.dart';
import 'package:marble_game/generated/l10n.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    Database database = context.watch();

    return Scaffold(
      backgroundColor: const Color(0xffecd0ff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.of(context).gameName,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.deepPurple),
                maxLines: 1,
              ),
              const SizedBox(height: 8.0),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 400),
                  child: ElevatedButton(
                    child: Text(S.of(context).play.toUpperCase(), maxLines: 1),
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 250),
                  child: ElevatedButton(
                    child: Text(S.of(context).about, maxLines: 1),
                    onPressed: () {},
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
                      await database.toggleMusicBool();
                    },
                    child: Text(
                      S.of(context).music,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  CheckboxMenuButton(
                    value: database.getSoundBool(),
                    onChanged: (_) async {
                      await database.toggleSoundBool();
                    },
                    child: Text(
                      S.of(context).sound,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
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
