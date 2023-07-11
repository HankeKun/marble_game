import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:marble_game/constants/global.dart';
import 'package:marble_game/constants/music_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class Database with ChangeNotifier {
  final SharedPreferences _prefs;
  late bool _didMusicPlay;

  Database(this._prefs) {
    _didMusicPlay = getMusicBool;
  }

  @FactoryMethod()
  static Future<Database> create() async {
    return Database(await SharedPreferences.getInstance());
  }

  final String _music = "music";
  final String _sound = "sound";
  final String _level = "level";
  final String _coins = "coins";

  bool get getMusicBool => _prefs.getBool(_music) ?? true;

  Future<void> toggleMusicBool() async {
    try {
      await _prefs.setBool(_music, !getMusicBool);
      _toggleMusic();
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

  int get getCoinsCount => _prefs.getInt(_coins) ?? 0;

  Future<void> countCoinsUp() async {
    await _prefs.setInt(_coins, getCoinsCount + 1);
    notifyListeners();
  }

  Future<void> setCoinsCount(int coins) async {
    await _prefs.setInt(_coins, coins);
    notifyListeners();
  }

  void _toggleMusic() {
    if (getMusicBool && _didMusicPlay) {
      FlameAudio.bgm.resume();
      return;
    }
    if (getMusicBool && !_didMusicPlay) {
      FlameAudio.bgm.play(MusicName.background);
      _didMusicPlay = true;
      return;
    }
    FlameAudio.bgm.pause();
  }
}
