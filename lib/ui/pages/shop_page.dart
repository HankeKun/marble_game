import 'package:flutter/material.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/enums/e_ball.dart';
import 'package:marble_game/generated/l10n.dart';
import 'package:marble_game/ui/components/ball_shop_component.dart';
import 'package:marble_game/ui/components/coin_ui_component.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return Scaffold(
      backgroundColor: ColorValue.background,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorValue.lightText,
        ),
        title: Text(
          lang.shop,
          style: TextStyle(color: ColorValue.lightText),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
        centerTitle: true,
        backgroundColor: ColorValue.appBar,
        scrolledUnderElevation: 0.0,
        actions: const [
          CoinUiComponent(),
          SizedBox(width: 8.0),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Wrap(
                    spacing: 16.0,
                    runSpacing: 16.0,
                    children: [
                      for (EBall ball in EBall.values) BallShopComponent(ball: ball),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
