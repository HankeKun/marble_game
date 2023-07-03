import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/generated/l10n.dart';

class GameOverDialog extends StatefulWidget {
  const GameOverDialog({super.key, required this.resetLevel});

  final Function resetLevel;

  @override
  State<GameOverDialog> createState() => _GameOverDialogState();
}

class _GameOverDialogState extends State<GameOverDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final lang = S.of(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            lang.gameOver,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.deepPurple),
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                context.pop();
              },
              child: Text(lang.back.toUpperCase()),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.resetLevel();
              },
              child: Text(lang.retry.toUpperCase()),
            ),
          ],
        ),
        barrierDismissible: false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
