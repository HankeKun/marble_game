// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Marble Game`
  String get gameName {
    return Intl.message(
      'Marble Game',
      name: 'gameName',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `About the app`
  String get about {
    return Intl.message(
      'About the app',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound {
    return Intl.message(
      'Sound',
      name: 'sound',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shop {
    return Intl.message(
      'Shop',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Purchase ball`
  String get buyBall {
    return Intl.message(
      'Purchase ball',
      name: 'buyBall',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Developer`
  String get developer {
    return Intl.message(
      'Developer',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `Development`
  String get development {
    return Intl.message(
      'Development',
      name: 'development',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get design {
    return Intl.message(
      'Design',
      name: 'design',
      desc: '',
      args: [],
    );
  }

  /// `Severin Hanke (@HankeKun)`
  String get severin {
    return Intl.message(
      'Severin Hanke (@HankeKun)',
      name: 'severin',
      desc: '',
      args: [],
    );
  }

  /// `Edonisa Mahmuti (@Nissaaaaa)`
  String get edonisa {
    return Intl.message(
      'Edonisa Mahmuti (@Nissaaaaa)',
      name: 'edonisa',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `This game was created in Flutter with Flame.\nIt is part of a module for university.`
  String get descriptionText {
    return Intl.message(
      'This game was created in Flutter with Flame.\nIt is part of a module for university.',
      name: 'descriptionText',
      desc: '',
      args: [],
    );
  }

  /// `Level Selection`
  String get levelSelection {
    return Intl.message(
      'Level Selection',
      name: 'levelSelection',
      desc: '',
      args: [],
    );
  }

  /// `Play on`
  String get playOn {
    return Intl.message(
      'Play on',
      name: 'playOn',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get pause {
    return Intl.message(
      'Pause',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Interrupt`
  String get interrupt {
    return Intl.message(
      'Interrupt',
      name: 'interrupt',
      desc: '',
      args: [],
    );
  }

  /// `Interrupt game`
  String get interruptGame {
    return Intl.message(
      'Interrupt game',
      name: 'interruptGame',
      desc: '',
      args: [],
    );
  }

  /// `Game interrupted`
  String get interruptedGame {
    return Intl.message(
      'Game interrupted',
      name: 'interruptedGame',
      desc: '',
      args: [],
    );
  }

  /// `The progress of an interrupted game will not be saved.`
  String get interruptGameNotSaved {
    return Intl.message(
      'The progress of an interrupted game will not be saved.',
      name: 'interruptGameNotSaved',
      desc: '',
      args: [],
    );
  }

  /// `Progress will not be saved.`
  String get progressNotSaved {
    return Intl.message(
      'Progress will not be saved.',
      name: 'progressNotSaved',
      desc: '',
      args: [],
    );
  }

  /// `Level completed!`
  String get completedLevel {
    return Intl.message(
      'Level completed!',
      name: 'completedLevel',
      desc: '',
      args: [],
    );
  }

  /// `Next level`
  String get nextLevel {
    return Intl.message(
      'Next level',
      name: 'nextLevel',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Game Over`
  String get gameOver {
    return Intl.message(
      'Game Over',
      name: 'gameOver',
      desc: '',
      args: [],
    );
  }

  /// `You do not have enough coins!`
  String get ballToExpensive {
    return Intl.message(
      'You do not have enough coins!',
      name: 'ballToExpensive',
      desc: '',
      args: [],
    );
  }

  /// `Background music`
  String get backgroundMusic {
    return Intl.message(
      'Background music',
      name: 'backgroundMusic',
      desc: '',
      args: [],
    );
  }

  /// `Lesfm - Just Relax`
  String get backgroundMusicTitle {
    return Intl.message(
      'Lesfm - Just Relax',
      name: 'backgroundMusicTitle',
      desc: '',
      args: [],
    );
  }

  /// `Purple ball`
  String get ballPurple {
    return Intl.message(
      'Purple ball',
      name: 'ballPurple',
      desc: '',
      args: [],
    );
  }

  /// `Red ball`
  String get ballRed {
    return Intl.message(
      'Red ball',
      name: 'ballRed',
      desc: '',
      args: [],
    );
  }

  /// `Blue ball`
  String get ballBlue {
    return Intl.message(
      'Blue ball',
      name: 'ballBlue',
      desc: '',
      args: [],
    );
  }

  /// `Colorful ball`
  String get ballColorful {
    return Intl.message(
      'Colorful ball',
      name: 'ballColorful',
      desc: '',
      args: [],
    );
  }

  /// `Tennis ball`
  String get ballTennis {
    return Intl.message(
      'Tennis ball',
      name: 'ballTennis',
      desc: '',
      args: [],
    );
  }

  /// `Volleyball`
  String get ballVolley {
    return Intl.message(
      'Volleyball',
      name: 'ballVolley',
      desc: '',
      args: [],
    );
  }

  /// `Soccerball`
  String get ballFoot {
    return Intl.message(
      'Soccerball',
      name: 'ballFoot',
      desc: '',
      args: [],
    );
  }

  /// `Bowling ball`
  String get ballBowling {
    return Intl.message(
      'Bowling ball',
      name: 'ballBowling',
      desc: '',
      args: [],
    );
  }

  /// `Invisible ball`
  String get ballInvisible {
    return Intl.message(
      'Invisible ball',
      name: 'ballInvisible',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to buy the ball for {amount} coins?`
  String buyBallForAmount(int amount) {
    return Intl.message(
      'Do you want to buy the ball for $amount coins?',
      name: 'buyBallForAmount',
      desc: '',
      args: [amount],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Error while changing Musicbox. Please try again!`
  String get errorMusicChange {
    return Intl.message(
      'Error while changing Musicbox. Please try again!',
      name: 'errorMusicChange',
      desc: '',
      args: [],
    );
  }

  /// `Error while changing Soundbox. Please try again!`
  String get errorSoundChange {
    return Intl.message(
      'Error while changing Soundbox. Please try again!',
      name: 'errorSoundChange',
      desc: '',
      args: [],
    );
  }

  /// `Error while changing the ball. Please try again!`
  String get errorSetCurrentBall {
    return Intl.message(
      'Error while changing the ball. Please try again!',
      name: 'errorSetCurrentBall',
      desc: '',
      args: [],
    );
  }

  /// `Error while purchasing a ball. Please try again!`
  String get errorPurchasingBall {
    return Intl.message(
      'Error while purchasing a ball. Please try again!',
      name: 'errorPurchasingBall',
      desc: '',
      args: [],
    );
  }

  /// `Level does not exist.`
  String get errorLevelDoesNotExist {
    return Intl.message(
      'Level does not exist.',
      name: 'errorLevelDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `Error while loading the level.\nPlease try again.`
  String get errorLoadingLevel {
    return Intl.message(
      'Error while loading the level.\nPlease try again.',
      name: 'errorLoadingLevel',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
