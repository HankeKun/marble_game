import 'package:marble_game/constants/image_name.dart';
import 'package:marble_game/generated/l10n.dart';

enum EBall {
  purpleBall,
  redBall,
  blueBall,
  colorfulBall,
  tennisBall,
  volleyBall,
  footBall,
  bowlingBall,
  invisibleBall,
}

extension EBallString on EBall {
  static String getBallString(EBall ball) {
    return switch (ball) {
      EBall.purpleBall => S.current.ballPurple,
      EBall.redBall => S.current.ballRed,
      EBall.blueBall => S.current.ballBlue,
      EBall.colorfulBall => S.current.ballColorful,
      EBall.tennisBall => S.current.ballTennis,
      EBall.volleyBall => S.current.ballVolley,
      EBall.footBall => S.current.ballFoot,
      EBall.bowlingBall => S.current.ballBowling,
      EBall.invisibleBall => S.current.ballInvisible,
    };
  }

  static String getBallImage(EBall ball) {
    return switch (ball) {
      EBall.purpleBall => ImageName.purpleBall,
      EBall.redBall => ImageName.redBall,
      EBall.blueBall => ImageName.blueBall,
      EBall.colorfulBall => ImageName.colorfulBall,
      EBall.tennisBall => ImageName.tennisBall,
      EBall.volleyBall => ImageName.volleyBall,
      EBall.footBall => ImageName.footBall,
      EBall.bowlingBall => ImageName.bowlingBall,
      EBall.invisibleBall => "",
    };
  }

  static int getBallPrice(EBall ball) {
    return switch (ball) {
      EBall.purpleBall => 0,
      EBall.redBall => 0,
      EBall.blueBall => 0,
      EBall.colorfulBall => 0,
      EBall.tennisBall => 15,
      EBall.volleyBall => 15,
      EBall.footBall => 15,
      EBall.bowlingBall => 20,
      EBall.invisibleBall => 100,
    };
  }
}
