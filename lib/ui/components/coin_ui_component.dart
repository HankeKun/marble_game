import 'package:flutter/material.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/services/database.dart';
import 'package:provider/provider.dart';

class CoinUiComponent extends StatelessWidget {
  const CoinUiComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Database database = context.watch();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "assets/images/${ImageName.coin1}",
          width: 25,
          height: 25,
        ),
        const SizedBox(width: 8),
        Text(
          database.getCoinsCount > 999 ? "999+" : database.getCoinsCount.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ColorValue.lightText),
          maxLines: 1,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
