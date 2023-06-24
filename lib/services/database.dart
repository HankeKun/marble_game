import 'package:flutter/material.dart';
import 'package:marble_game/constants/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:marble_game/generated/l10n.dart';

class Database with ChangeNotifier {
  final SharedPreferences _prefs;

  Database(this._prefs);

  final String _music = 'music';
  final String _sound = 'sound';

  bool getMusicBool() {
    return _prefs.getBool(_music) ?? true;
  }

  Future<void> toggleMusicBool() async {
    try {
      await _prefs.setBool(_music, !getMusicBool());
      notifyListeners();
    } catch (e) {
      Global.snackbarKey.currentState?.hideCurrentSnackBar();
      Global.snackbarKey.currentState?.showSnackBar(
          SnackBar(
            content: Text(S.current.errorMusicChange),
            showCloseIcon: true,
          ),
      );
    }
  }

  bool getSoundBool() {
    return _prefs.getBool(_sound) ?? true;
  }

  Future<void> toggleSoundBool() async {
    try {
      await _prefs.setBool(_sound, !getSoundBool());
      notifyListeners();
    } catch (e) {
      Global.snackbarKey.currentState?.hideCurrentSnackBar();
      Global.snackbarKey.currentState?.showSnackBar(
        SnackBar(
          content: Text(S.current.errorSoundChange),
          showCloseIcon: true,
        ),
      );
    }
  }
}
