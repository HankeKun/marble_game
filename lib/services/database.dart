import 'package:flutter/material.dart';
import 'package:marble_game/constants/global.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database with ChangeNotifier {
  final SharedPreferences _prefs;

  Database(this._prefs);

  final String _music = "music";
  final String _sound = "sound";
  final String _level = "level";

  bool get getMusicBool => _prefs.getBool(_music) ?? true;

  Future<void> toggleMusicBool() async {
    try {
      await _prefs.setBool(_music, !getMusicBool);
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

  bool get getSoundBool => _prefs.getBool(_sound) ?? true;

  Future<void> toggleSoundBool() async {
    try {
      await _prefs.setBool(_sound, !getSoundBool);
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

  int get getActualLevel => _prefs.getInt(_level) ?? 1;

  Future<void> setActualLevel(int level) async {
    if (level <= getActualLevel) return;
    await _prefs.setInt(_level, level);
    notifyListeners();
  }
}
