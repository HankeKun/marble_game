import 'package:flutter/material.dart';
import 'package:marble_game/constants/color_value.dart';
import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/enums/e_ball.dart';
import 'package:marble_game/services/database.dart';
import 'package:marble_game/ui/components/purchase_ball_dialog.dart';
import 'package:provider/provider.dart';

class BallShopComponent extends StatelessWidget {
  const BallShopComponent({super.key, required this.ball});

  final EBall ball;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Database database = context.watch();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () async {
            if (database.purchasedBalls.contains(ball)) {
              await database.setCurrentBall(ball);
            } else {
              final value = await showDialog<bool>(
                context: context,
                builder: (context) => PurchaseBallDialog(coins: EBallString.getBallPrice(ball)),
              );
              if (value == true) {
                await database.purchaseBall(ball);
              }
            }
          },
          child: Ink(
            decoration: BoxDecoration(
              color: _getLevelColor(database),
              border: Border.all(
                width: 3.0,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            width: 90,
            height: 90,
            child: Stack(
              children: [
                Center(
                  child: (ball == EBall.invisibleBall)
                      ? null
                      : Image.asset("assets/images/${EBallString.getBallImage(ball)}"),
                ),
                if (!database.purchasedBalls.contains(ball))
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                  ),
                if (!database.purchasedBalls.contains(ball))
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            EBallString.getBallPrice(ball).toString(),
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: ColorValue.background),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Image.asset(
                          "assets/images/${ImageName.coin1}",
                          width: Theme.of(context).textTheme.headlineSmall?.fontSize,
                          height: Theme.of(context).textTheme.headlineSmall?.fontSize,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        SizedBox(
          width: 150,
          child: Text(
            EBallString.getBallString(ball),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: theme.primaryColor),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }

  Color _getLevelColor(Database database) {
    if (database.currentBall == ball) {
      return ColorValue.completedLevel;
    } else if (database.purchasedBalls.contains(ball)) {
      return ColorValue.actualLevel;
    }
    return ColorValue.lockedLevel;
  }
}
