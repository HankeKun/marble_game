import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marble_game/enums/e_ball.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/get_it/get_it.dart';
import 'package:marble_game/main.dart';
import 'package:marble_game/ui/components/ball_shop_component.dart';
import 'package:marble_game/ui/components/coin_ui_component.dart';
import 'package:marble_game/ui/components/level_component.dart';
import 'package:marble_game/ui/components/sound_checkbox_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    /// Initializing all services with mock values
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SharedPreferences.setMockInitialValues({
      "music": false,
      "sound": false,
      "level": 5,
      "coins": 12,
      "current-ball": EBall.blueBall.name,
      "purchased-balls": [EBall.purpleBall.name, EBall.redBall.name, EBall.blueBall.name, EBall.colorfulBall.name],
    });
    await configureDependencies();
  });

  tearDown(() async {
    await getIt.reset();
    await configureDependencies();
  });

  testWidgets('HomePage test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    final lang = S.current;

    final headlineText = find.text(lang.gameName);
    final coinUiComponent = find.byWidgetPredicate((widget) => widget is CoinUiComponent);
    final playButton = find.widgetWithText(ElevatedButton, lang.play.toUpperCase());
    final shopButton = find.widgetWithText(ElevatedButton, lang.shop.toUpperCase());
    final aboutButton = find.widgetWithText(ElevatedButton, lang.about);
    final soundCheckbox = find.byWidgetPredicate((widget) => widget is SoundCheckboxComponent && !widget.isDark);

    expect(headlineText, findsOneWidget);
    expect(coinUiComponent, findsOneWidget);
    expect(playButton, findsOneWidget);
    expect(shopButton, findsOneWidget);
    expect(aboutButton, findsOneWidget);
    expect(soundCheckbox, findsOneWidget);
  });

  testWidgets('LevelSelectionPage test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    final lang = S.current;
    await tester.tap(find.widgetWithText(ElevatedButton, lang.play.toUpperCase()));
    await tester.pump();
    await tester.pumpAndSettle();

    final headlineText = find.text(lang.levelSelection);
    final levelComponent = find.byWidgetPredicate((widget) => widget is LevelComponent);

    expect(headlineText, findsOneWidget);
    expect(levelComponent, findsWidgets);
  });

  testWidgets('ShopPage test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    final lang = S.current;
    await tester.tap(find.widgetWithText(ElevatedButton, lang.shop.toUpperCase()));
    await tester.pump();
    await tester.pumpAndSettle();

    final headlineText = find.text(lang.shop);
    final ballShopComponent = find.byWidgetPredicate((widget) => widget is BallShopComponent);

    expect(headlineText, findsOneWidget);
    expect(ballShopComponent, findsWidgets);
  });

  testWidgets('AboutPage test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    final lang = S.current;
    await tester.tap(find.widgetWithText(ElevatedButton, lang.about));
    await tester.pump();
    await tester.pumpAndSettle();

    final headlineText = find.text(lang.about);
    final aboutText = find.byWidgetPredicate((widget) => widget is Text);

    expect(headlineText, findsOneWidget);
    expect(aboutText, findsAtLeastNWidgets(8));
  });
}
