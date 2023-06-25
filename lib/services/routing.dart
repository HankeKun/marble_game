import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/route_name.dart';
import 'package:marble_game/ui/pages/about_page.dart';
import 'package:marble_game/ui/pages/home_page.dart';
import 'package:marble_game/ui/pages/level_selection_page.dart';

class Routing {
  static final router = GoRouter(
    initialLocation: RouteName.homepage,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: RouteName.homepage,
        name: RouteName.homepage,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomePage(),
        ),
        routes: [
          GoRoute(
            path: RouteName.levelSelection,
            name: RouteName.levelSelection,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const LevelSelectionPage(),
            ),
          ),
          GoRoute(
            path: RouteName.about,
            name: RouteName.about,
            pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const AboutPage(),
            ),
          ),
        ],
      ),
    ],
  );
}
