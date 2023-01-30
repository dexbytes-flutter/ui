import 'dart:async';
import 'dart:io';
import 'package:base_flutter_app/src/pages/sign_in_screen.dart';
import 'package:base_flutter_app/src/pages/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:lottie/lottie.dart';

import '../all_file_import/app_widget_files_link.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool copAnimated = false;
  bool animateCafeText = false;

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        _coffeeController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 2), () {
          animateCafeText = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: appColors.appThemeColor1,
      body: Stack(
        children: [
          // White Container top half
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: copAnimated ? screenHeight / 1.6 : screenHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(copAnimated ? 40.0 : 0.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Visibility(
                  visible: !copAnimated,
                  child: Lottie.asset(
                    'assets/app_theme/coffeesplash.json',
                    controller: _coffeeController,
                    onLoaded: (composition) {
                      _coffeeController
                        ..duration = composition.duration
                        ..forward();
                    },
                  ),
                ),
                Visibility(
                  visible: copAnimated,
                  child: Image.asset(
                    'assets/images/coffeepic2.png',
                    height: 190.0,
                    width: 190.0,
                  ),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: animateCafeText ? 1 : 0,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'C A F É',
                      style: TextStyle(fontSize: 50.0, color: appColors.appThemeColor1),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text bottom part
          Visibility(visible: copAnimated, child: const _BottomPart()),
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height/1.8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Log in button
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height/20,
                left: MediaQuery.of(context).size.width/4.5,
                right: MediaQuery.of(context).size.width/4.5,
              ),
              child: CommonButton(
                buttonColor: Colors.green,
                buttonName: "Sign In",
                buttonHeight: 50,
                buttonBorderRadius: 12,
                isBottomMarginRequired: false,
                textStyle: TextStyle(fontSize:16, fontWeight: FontWeight.w700,color: Colors.grey.shade200 ),
                backCallback: (){

                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                      return SignInScreen();
                    }), (route) => false);

                },
              ),
            ),
            // Sign up button
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height/20,
                left: MediaQuery.of(context).size.width/4.5,
                right: MediaQuery.of(context).size.width/4.5,
              ),
              child: CommonButton(
                buttonColor: Colors.white,
                buttonName: "Join Us",
                buttonHeight: 50,
                buttonBorderRadius: 12,
                isBottomMarginRequired: false,
                textStyle: TextStyle(fontSize:16, fontWeight: FontWeight.w700,color: appColors.appThemeColor1),
                backCallback: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return SignUpScreen();
                  }), (route) => false);
                },
              ),
            ),
           /* const Text(
              'Find The Best Coffee for You',
              style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Lorem ipsum dolor sit amet, adipiscing elit. '
                  'Nullam pulvinar dolor sed enim eleifend efficitur.',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white.withOpacity(0.8),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 50.0),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 85.0,
                width: 85.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: const Icon(
                  Icons.chevron_right,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 50.0),*/
          ],
        ),
      ),
    );
  }
}

