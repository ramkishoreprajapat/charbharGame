import 'package:charbhar_game/Constants/AppConstant.dart';
import 'package:charbhar_game/model/game_button.dart';
import 'package:charbhar_game/model/KeyButton.dart';
import 'package:charbhar_game/Utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PlayGame extends StatefulWidget {
  @override
  _PlayGameState createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  List<GB> mList;
  var player1;
  var player2;
  var activePlayer;
  List<KeyButton> player1Keys;
  List<KeyButton> player2Keys;
  var playingStatus = AppConstant.NOT_STARTED;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /*Hiding status bar*/
    SystemChrome.setEnabledSystemUIOverlays([]);
    mList = doInit();
  }

  List<GB> doInit() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;
    playingStatus = AppConstant.NOT_STARTED;

    player1Keys = Utility.getKeys('assets/images/theme_1_3.jpg');
    player2Keys = Utility.getKeys('assets/images/theme_1_4.jpg');

    var tempList = <GB>[
      GB(id: 1, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 2, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 3, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 4, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 5, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 6, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 7, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 8, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 9, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 10, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 11, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 12, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 13, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 14, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 15, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 16, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 17, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 18, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 19, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 20, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 21, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 22, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 23, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 24, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 25, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 26, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 27, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 28, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 29, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 30, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 31, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 32, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 33, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 34, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 35, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 36, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 37, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 38, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 39, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 40, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 41, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 42, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 43, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 44, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 45, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 46, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 47, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 48, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 49, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 50, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 51, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 52, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 53, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 54, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 55, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 56, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 57, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 58, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 59, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 60, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 61, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 62, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 63, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 64, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 65, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 66, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 67, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 68, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 69, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 70, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 71, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 72, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 73, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 74, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 75, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 76, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 77, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 78, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 79, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 80, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 81, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 82, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 83, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 84, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 85, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 86, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 87, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 88, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 89, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 90, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 91, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 92, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 93, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 94, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 95, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 96, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 97, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 98, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 99, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 100, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 101, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 102, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 103, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 104, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 105, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 106, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 107, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 108, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 109, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 110, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 111, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 112, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 113, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 114, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 115, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 116, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 117, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 118, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 119, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 120, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 121, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 122, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 123, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 124, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 125, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 126, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 127, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 128, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 129, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 130, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 131, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 132, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 133, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 134, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 135, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 136, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 137, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 138, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 139, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 140, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 141, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 142, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 143, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 144, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 145, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 146, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 147, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 148, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 149, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 150, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 151, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 152, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 153, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 154, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 155, type: AppConstant.EMPTY_SLOT, bgImage: ''),
      GB(id: 156, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 157, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 158, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 159, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 160, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 161, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 162, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 163, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
      GB(id: 164, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 165, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 166, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 167, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 168, type: AppConstant.BG_SLOT, bgImage: 'assets/images/theme_1_1.jpg'),
      GB(id: 169, type: AppConstant.SLOT, bgImage: 'assets/images/theme_1_2.jpg'),
    ];

    return tempList;
  }

  playGame(GB gb) {
    setState(() {

        if (gb.type == AppConstant.SLOT
            && gb.status == AppConstant.FREE_SPACE
            && playingStatus == AppConstant.NOT_STARTED) {

          if (activePlayer == 1) {
            player1.add(gb.id);
            gb.status = AppConstant.PLAYER_1_SLOT;
            gb.bgImage = 'assets/images/theme_1_3.jpg';

            if(player1Keys.length > 0) {
              player1Keys.removeAt(0);
            }

            checkLogic(gb);
            activePlayer = 2;
          } else {

            player2.add(gb.id);
            gb.status = AppConstant.PLAYER_2_SLOT;
            gb.bgImage = 'assets/images/theme_1_4.jpg';
            if(player2Keys.length > 0) {
              player2Keys.removeAt(0);
            }
          }

          //game started now
          if(player1Keys.length == 0 && player2Keys.length == 0){
            playingStatus = AppConstant.STARTED;
          }

          checkLogic(gb);
          activePlayer = 1;
        }
    });
  }

  void checkLogic(GB gb) {
    var id = gb.id;
    var whichPlayer = gb.status;

    if(id == 1 && mList[79-1].status == whichPlayer && mList[157-1].status == whichPlayer){

    } else if (id == 1 && mList[7-1].status == whichPlayer && mList[13-1].status == whichPlayer) {
      
    } else if(id == 7 && mList[1-1].status == whichPlayer && mList[13-1].status == whichPlayer){

    } else if(id == 7 && mList[33-1].status == whichPlayer && mList[59-1].status == whichPlayer){

    } else if(id == 13 && mList[7-1].status == whichPlayer && mList[1-1].status == whichPlayer){

    } else if(id == 13 && mList[91-1].status == whichPlayer && mList[169-1].status == whichPlayer){

    } else if(id == 91 && mList[13-1].status == whichPlayer && mList[169-1].status == whichPlayer){

    } else if(id == 91 && mList[89-1].status == whichPlayer && mList[87-1].status == whichPlayer){

    } else if(id == 169 && mList[91-1].status == whichPlayer && mList[13-1].status == whichPlayer){

    } else if(id == 169 && mList[163-1].status == whichPlayer && mList[157-1].status == whichPlayer){

    } else if(id == 163 && mList[169-1].status == whichPlayer && mList[157-1].status == whichPlayer){

    } else if(id == 163 && mList[137-1].status == whichPlayer && mList[111-1].status == whichPlayer){

    } else if(id == 157 && mList[163-1].status == whichPlayer && mList[169-1].status == whichPlayer){

    } else if(id == 157 && mList[79-1].status == whichPlayer && mList[1-1].status == whichPlayer){
//14
    } else if(id == 29 && mList[81-1].status == whichPlayer && mList[133-1].status == whichPlayer){

    } else if(id == 29 && mList[33-1].status == whichPlayer && mList[37-1].status == whichPlayer){

    } else if(id == 33 && mList[29-1].status == whichPlayer && mList[37-1].status == whichPlayer){

    } else if(id == 33 && mList[7-1].status == whichPlayer && mList[59-1].status == whichPlayer){

    } else if(id == 37 && mList[33-1].status == whichPlayer && mList[29-1].status == whichPlayer){

    } else if(id == 37 && mList[89-1].status == whichPlayer && mList[141-1].status == whichPlayer){

    } else if(id == 89 && mList[37-1].status == whichPlayer && mList[141-1].status == whichPlayer){

    } else if(id == 89 && mList[87-1].status == whichPlayer && mList[91-1].status == whichPlayer){

    } else if(id == 141 && mList[89-1].status == whichPlayer && mList[37-1].status == whichPlayer){

    } else if(id == 141 && mList[137-1].status == whichPlayer && mList[133-1].status == whichPlayer){

    } else if(id == 137 && mList[141-1].status == whichPlayer && mList[133-1].status == whichPlayer){

    } else if(id == 137 && mList[111-1].status == whichPlayer && mList[163-1].status == whichPlayer){

    } else if(id == 133 && mList[137-1].status == whichPlayer && mList[141-1].status == whichPlayer){

    } else if(id == 133 && mList[81-1].status == whichPlayer && mList[29-1].status == whichPlayer){

    } else if(id == 81 && mList[133-1].status == whichPlayer && mList[29-1].status == whichPlayer){

    } else if(id == 81 && mList[79-1].status == whichPlayer && mList[83-1].status == whichPlayer){
    //16
    } else if(id == 57 && mList[83-1].status == whichPlayer && mList[109-1].status == whichPlayer){

    } else if(id == 57 && mList[59-1].status == whichPlayer && mList[61-1].status == whichPlayer){

    } else if(id == 59 && mList[57-1].status == whichPlayer && mList[61-1].status == whichPlayer){

    } else if(id == 59 && mList[33-1].status == whichPlayer && mList[7-1].status == whichPlayer){

    } else if(id == 61 && mList[59-1].status == whichPlayer && mList[57-1].status == whichPlayer){

    } else if(id == 61 && mList[87-1].status == whichPlayer && mList[113-1].status == whichPlayer){

    } else if(id == 87 && mList[61-1].status == whichPlayer && mList[113-1].status == whichPlayer){

    } else if(id == 87 && mList[89-1].status == whichPlayer && mList[91-1].status == whichPlayer){

    } else if(id == 113 && mList[87-1].status == whichPlayer && mList[61-1].status == whichPlayer){

    } else if(id == 113 && mList[111-1].status == whichPlayer && mList[109-1].status == whichPlayer){

    } else if(id == 111 && mList[109-1].status == whichPlayer && mList[113-1].status == whichPlayer){

    } else if(id == 111 && mList[137-1].status == whichPlayer && mList[163-1].status == whichPlayer){

    } else if(id == 109 && mList[111-1].status == whichPlayer && mList[113-1].status == whichPlayer){

    } else if(id == 109 && mList[83-1].status == whichPlayer && mList[57-1].status == whichPlayer){

    } else if(id == 83 && mList[57-1].status == whichPlayer && mList[109-1].status == whichPlayer){

    } else if(id == 83 && mList[81-1].status == whichPlayer && mList[79-1].status == whichPlayer){

    }

  }

  @override
  Widget build(BuildContext context) {
    return (new Material(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 30.0,
              maxHeight: 30.0,
            ),
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: player2Keys.length, itemBuilder: (context, index) {
                return Container(
                  width: 30,
                  height: 30,
//                width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(

                    child: Container(
                      child: new Image.asset(
                        player2Keys[index].bgImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          GridView.builder(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 13,
              childAspectRatio: 1.0,
            ),
            itemCount: mList.length,
            itemBuilder: (context, i) => SizedBox(
              width: 10.0,
              height: 10.0,
              child: GestureDetector(
                child: new Container(
                  child: new Image.asset(
                    mList[i].bgImage,
                    fit: BoxFit.fill,
                  ),
                ),
                onTap: () => playGame(mList[i]),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: new BoxConstraints(
              minHeight: 30.0,
              maxHeight: 30.0,
            ),
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.10,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: player1Keys.length, itemBuilder: (context, index) {
                return Container(
                  width: 30,
                  height: 30,
//                width: MediaQuery.of(context).size.width * 0.3,
                  child: Card(

                    child: Container(
                      child: new Image.asset(
                        player1Keys[index].bgImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    )));
  }

}
