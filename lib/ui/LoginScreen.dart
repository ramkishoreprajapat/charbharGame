import 'package:charbhar_game/Constants/AppColors.dart';
import 'package:charbhar_game/Constants/AppStrings.dart';
import 'package:charbhar_game/Constants/AppFonts.dart';
import 'package:charbhar_game/Widgets/CustomButton.dart';
import 'package:charbhar_game/ui/OptionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  _backGroundImage() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]); // Hiding status bar

    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    _animation = new CurvedAnimation(
        parent: _animationController, curve: Curves.easeOut);

    _animation.addListener(() {
      this.setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.colorGradientStart, AppColors.colorGradientEnd],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Image.asset(
              "assets/images/logoapp.png",
              width: _animation.value * 250,
              height: _animation.value * 250,
            ),
            new SizedBox(
              height: 10,
            ),
            new RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: AppStrings.first_word,
                    style: TextStyle(
                        color: AppColors.colorWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: AppFonts.harabaraMaisDemo)),
                TextSpan(
                    text: AppStrings.second_word,
                    style: TextStyle(
                        color: AppColors.colorYellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: AppFonts.harabaraMaisDemo))
              ]),
            ),
            new Text(
              AppStrings.let_us_choose_your_login,
              style: TextStyle(
                color: AppColors.colorDarkBrown,
                fontSize: 12,
                fontWeight: FontWeight.normal,
                fontFamily: AppFonts.gothamRoundedMedium,
              ),
            ),
            new SizedBox(
              height: 30,
            ),
            new GestureDetector(
              child: new Container(
                height: 50.0,
                width: 250.0,
                child: new CustomButton(str:AppStrings.guest, imgPath: 'assets/images/user.png',),
              ),
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OptionScreen()))
            ),
            new SizedBox(
              height: 5,
            ),
            new Container(
                height: 50.0,
                width: 250.0,
                child: new CustomButton(str:AppStrings.google, imgPath: 'assets/images/google.png',)
            ),new SizedBox(
              height: 5,
            ),
            new Container(
                height: 50.0,
                width: 250.0,
                child: new CustomButton(str:AppStrings.facebook, imgPath: 'assets/images/facebook.png',)
            )
          ],
        ),
      ),
    );
  }
}
