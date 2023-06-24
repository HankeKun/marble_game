import 'package:flame_splash_screen/flame_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlameSplashScreen(
        theme: FlameSplashTheme(
          logoBuilder: (BuildContext context) {
            return Center(
              child: Image.asset("assets/images/marbles-rolling.gif"),
            );
          },
          backgroundDecoration: BoxDecoration(color: ColorValue.backgroundPurple),
        ),
        onFinish: (context) => context.goNamed(RouteName.homepage),
      ),
    );
  }
}
