import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:marble_game/constants/music_name.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/get_it/get_it.dart';
import 'package:marble_game/services/database.dart';
import 'package:marble_game/services/routing.dart';
import 'package:marble_game/services/show_snackbar.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await configureDependencies();
  await FlameAudio.audioCache.loadAll([MusicName.background, MusicName.marbleDrop]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routing = getIt.get<Routing>();
    final snackbar = getIt.get<ShowSnackbar>();

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
        scaffoldMessengerKey: snackbar.snackbarKey,
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
