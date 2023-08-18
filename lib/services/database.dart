import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:marble_game/constants/music_name.dart';
import 'package:marble_game/enums/e_ball.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/services/show_snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class Database with ChangeNotifier {
  final SharedPreferences _prefs;
  final ShowSnackBar _snackBar;
  late bool _didMusicPlay;

  Database(this._prefs, this._snackBar) {
    _didMusicPlay = getMusicBool;
  }

  @FactoryMethod()
  static Future<Database> create(ShowSnackBar snackBar) async {
    return Database(await SharedPreferences.getInstance(), snackBar);
  }

  final String _music = "music";
  final String _sound = "sound";
  final String _currentBall = "current-ball";

  bool get getMusicBool => _prefs.getBool(_music) ?? true;

  Future<void> toggleMusicBool() async {
    try {
      await _prefs.setBool(_music, !getMusicBool);
      _toggleMusic();
      notifyListeners();
    } catch (e) {
      _snackBar.showSnackbar(S.current.errorMusicChange);
    }
  }

  bool get getSoundBool => _prefs.getBool(_sound) ?? true;

  Future<void> toggleSoundBool() async {
    try {
      await _prefs.setBool(_sound, !getSoundBool);
      notifyListeners();
    } catch (e) {
      _snackBar.showSnackbar(S.current.errorSoundChange);
    }
  }

  int get getActualLevel => 100;

  Future<void> setActualLevel(int level) async {
    notifyListeners();
  }

  int get getCoinsCount => 5000;

  Future<void> countCoinsUp() async {
    notifyListeners();
  }

  Future<void> setCoinsCount(int coins) async {
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

  EBall get currentBall {
    final ballString = _prefs.getString(_currentBall) ?? EBall.purpleBall.name;
    return EBall.values.firstWhere((element) => element.name == ballString);
  }

  Future<void> setCurrentBall(EBall currentBall) async {
    try {
      await _prefs.setString(_currentBall, currentBall.name);
      notifyListeners();
    } catch (e) {
      _snackBar.showSnackbar(S.current.errorSetCurrentBall);
    }
  }

  List<EBall> get purchasedBalls {
    return EBall.values;
  }

  Future<void> purchaseBall(EBall ball) async {
    notifyListeners();
  }
}
