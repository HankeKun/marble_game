import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marble_game/constants/global.dart';
import 'package:marble_game/constants/music_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/get_it/get_it.dart';
import 'package:marble_game/services/database.dart';
import 'package:marble_game/services/routing.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await configureDependencies();
  await FlameAudio.audioCache.loadAll([MusicName.background, MusicName.marbleDrop]);
  runApp(MyApp(sharedPreferences: await SharedPreferences.getInstance()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    final routing = getIt.get<Routing>();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => getIt.get<Database>()),
      ],
      child: MaterialApp.router(
        title: 'Marble Game',
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('de'),
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ).copyWith(
          highlightColor: const Color(0x33000000),
          splashColor: const Color(0x19000000),
        ),
        routerConfig: routing.router,
        scaffoldMessengerKey: Global.snackbarKey,
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
