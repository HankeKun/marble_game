import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database with ChangeNotifier {
  final SharedPreferences _prefs;

  Database(this._prefs);

  final String _music = 'music';
  final String _sound = 'sound';

  bool getMusicBool() {
    return _prefs.getBool(_music) ?? true;
  }

  Future<void> toggleMusicBool() async {
    await _prefs.setBool(_music, !getMusicBool());
    notifyListeners();
  }

  bool getSoundBool() {
    return _prefs.getBool(_sound) ?? true;
  }

  Future<void> toggleSoundBool() async {
    await _prefs.setBool(_sound, !getSoundBool());
    notifyListeners();
  }
}
