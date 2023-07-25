import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/constants/music_name.dart';
import 'package:marble_game/enums/e_ball.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/services/show_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class Database with ChangeNotifier {
  final SharedPreferences _prefs;
  final ShowSnackbar _snackbar;
  late bool _didMusicPlay;

  Database(this._prefs, this._snackbar) {
    _didMusicPlay = getMusicBool;
  }

  @FactoryMethod()
  static Future<Database> create(ShowSnackbar snackbar) async {
    return Database(await SharedPreferences.getInstance(), snackbar);
  }

  final String _music = "music";
  final String _sound = "sound";
  final String _level = "level";
  final String _coins = "coins";
  final String _currentBall = "current-ball";
  final String _purchasedBalls = "purchased-balls";

  bool get getMusicBool => _prefs.getBool(_music) ?? true;

  Future<void> toggleMusicBool() async {
    try {
      await _prefs.setBool(_music, !getMusicBool);
      _toggleMusic();
      notifyListeners();
    } catch (e) {
      _snackbar.showSnackbar(S.current.errorMusicChange);
    }
  }

  bool get getSoundBool => _prefs.getBool(_sound) ?? true;

  Future<void> toggleSoundBool() async {
    try {
      await _prefs.setBool(_sound, !getSoundBool);
      notifyListeners();
    } catch (e) {
      _snackbar.showSnackbar(S.current.errorSoundChange);
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

  EBall get currentBall {
    final ballString = _prefs.getString(_currentBall) ?? EBall.purpleBall.name;
    return EBall.values.firstWhere((element) => element.name == ballString);
  }

  Future<void> setCurrentBall(EBall currentBall) async {
    try {
      await _prefs.setString(_currentBall, currentBall.name);
      notifyListeners();
    } catch (e) {
      _snackbar.showSnackbar(S.current.errorSetCurrentBall);
    }
  }

  List<EBall> get purchasedBalls {
    List<String> purchasedBallsString = _prefs.getStringList(_purchasedBalls) ?? [];
    List<EBall> purchasedBalls = purchasedBallsString.map((ball) {
      return EBall.values.firstWhere((element) => element.name == ball);
    }).toList();
    purchasedBalls.addAll([EBall.purpleBall, EBall.redBall, EBall.blueBall, EBall.colorfulBall]);
    return purchasedBalls;
  }

  Future<void> purchaseBall(EBall ball) async {
    try {
      if (getCoinsCount < EBallString.getBallPrice(ball)) {
        _snackbar.showSnackbar(S.current.ballToExpensive);
        return;
      }
      List<String> purchasedBalls = _prefs.getStringList(_purchasedBalls) ?? [];
      purchasedBalls.add(ball.name);
      await _prefs.setStringList(_purchasedBalls, purchasedBalls);
      await setCoinsCount(getCoinsCount - EBallString.getBallPrice(ball));
      notifyListeners();
    } catch (e) {
      _snackbar.showSnackbar(S.current.errorPurchasingBall);
    }
  }
}
