import 'dart:async';

import 'package:charbhar_game/Constants/AppColors.dart';
import 'package:charbhar_game/Constants/AppStrings.dart';
import 'package:charbhar_game/Constants/AppFonts.dart';
import 'package:charbhar_game/Widgets/CustomButton.dart';
import 'package:charbhar_game/ui/OptionScreen.dart';
import 'package:charbhar_game/ui/PlayGame.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation<double> _animation;

  final DocumentReference documentReference = Firestore.instance.document(
        "game/user");
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  StreamSubscription<DocumentSnapshot> subscription;

  Future<FirebaseUser> _sign() async {
    print("signed in testing");
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = (await _auth.signInWithCredential(credential))
        .user;
    print("signed in " + user.displayName);
    return user;
  }

  void setUpAnimationIcon() {
    _animationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    _animation = new CurvedAnimation(
        parent: _animationController, curve: Curves.easeOut);

    _animation.addListener(() {
      this.setState(() {});
    });

    _animationController.forward();
  }

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

     /*Hiding status bar*/
    SystemChrome.setEnabledSystemUIOverlays([]);

    setUpAnimationIcon();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
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
           new GestureDetector(
              child: new Container(
                  height: 50.0,
                  width: 250.0,
                  child: new CustomButton(str:AppStrings.google, imgPath: 'assets/images/google.png',)
              ),
              onTap: ()  =>
                  _sign().then((FirebaseUser user) => print(user))
                      .catchError((e) => print("Sign In Error : $e")),
            ),new SizedBox(
              height: 5,
            ),
           new GestureDetector(
             onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PlayGame())),
              child: new Container(
                  height: 50.0,
                  width: 250.0,
                  child: new CustomButton(str:AppStrings.facebook, imgPath: 'assets/images/facebook.png',)
              ),
            )
          ],
        ),
      ),
    );
  }

  void _add() {
    print("Document Adding...");
    Map<String, String> data = <String, String>{
      "name": "Ram Kishore",
      "desc": "software Er."
    };

    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

}
