import 'package:charbhar_game/Constants/AppColors.dart';
import 'package:charbhar_game/Constants/AppStrings.dart';
import 'package:charbhar_game/Widgets/CustomButton.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Material( child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.colorGradientStart, AppColors.colorGradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
              child: new Container(
                height: 50.0,
                width: 250.0,
                child: new CustomButton(str:AppStrings.play, imgPath: 'assets/images/play.png',),
              ),
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OptionScreen()))
          ),
          new SizedBox(
            height: 5,
          ),
          new GestureDetector(
            child: new Container(
                height: 50.0,
                width: 250.0,
                child: new CustomButton(str:AppStrings.settings, imgPath: 'assets/images/settings.png',)
            ),

          ),new SizedBox(
            height: 5,
          ),
          new GestureDetector(
            child: new Container(
                height: 50.0,
                width: 250.0,
                  child: new CustomButton(str:AppStrings.help, imgPath: 'assets/images/help.png',)
            ),
          )
        ],
      ),
    ),
    );
  }
}
