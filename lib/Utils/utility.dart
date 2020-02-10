import 'package:charbhar_game/model/KeyButton.dart';
class Utility {
  static getKeys(String path) {
    return <KeyButton>[
      KeyButton(id: 1, bgImage: path),
      KeyButton(id: 2, bgImage: path),
      KeyButton(id: 3, bgImage: path),
      KeyButton(id: 4, bgImage: path),
      KeyButton(id: 5, bgImage: path),
      KeyButton(id: 6, bgImage: path),
      KeyButton(id: 7, bgImage: path),
      KeyButton(id: 8, bgImage: path),
      KeyButton(id: 9, bgImage: path),];
  }

}