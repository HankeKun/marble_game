import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marble_game/get_it/get_it.dart';
import 'package:marble_game/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    /// Initializing all services with mock values
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SharedPreferences.setMockInitialValues({});
    await configureDependencies();
  });

  testWidgets('Homepage test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
