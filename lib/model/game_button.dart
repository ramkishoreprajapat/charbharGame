import 'package:charbhar_game/Constants/AppConstant.dart';

class GB {
  final id;
  int status;
  final type;
  String bgImage;

  GB(
      {this.id, this.type = 0, this.bgImage, this.status = AppConstant.FREE_SPACE});
}
