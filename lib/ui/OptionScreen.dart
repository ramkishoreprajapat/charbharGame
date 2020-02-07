import 'package:charbhar_game/Constants/AppColors.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatefulWidget {
  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.colorGradientStart, AppColors.colorGradientEnd],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
    ));
  }
}
