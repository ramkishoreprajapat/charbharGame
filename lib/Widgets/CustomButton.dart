import 'package:charbhar_game/Constants/AppColors.dart';
import 'package:charbhar_game/Constants/AppFonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.str, this.imgPath});
  final String str, imgPath;
  @override
  Widget build(BuildContext context) {
    String text;
    return Stack(
      children: <Widget>[
        new Container(
          height: 40.0,
          margin: EdgeInsets.only(left: 2, top: 5),
          decoration: BoxDecoration(
            color: Colors.white10,
            border: Border.all(color: AppColors.colorWhite, width: 1.0),
            borderRadius: new BorderRadius.circular(25.0),
          ),
        ),
        new Image.asset(
          "assets/images/drop.png",
          width: 50,
          height: 50,
        ),
        new Positioned(
          left: 10,
          top: 11,
          child: Image.asset(
            imgPath,
            width: 20,
            height: 20,
          ),
        ),
        new Positioned(
            left: 110.0,
            top: 15,
            child: Container(
              child: Text(
                str??'',
                style: TextStyle(
                    fontFamily: AppFonts.pointDEMOSemiBold,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorWhite),
                textAlign: TextAlign.center,
              ),
            ))
      ],
    );
  }
}
