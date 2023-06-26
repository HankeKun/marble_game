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

  /// `Level does not exist.`
  String get errorLevelDoesNotExist {
    return Intl.message(
      'Level does not exist.',
      name: 'errorLevelDoesNotExist',
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
