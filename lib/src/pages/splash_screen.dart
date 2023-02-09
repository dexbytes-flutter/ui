import 'dart:async';
import 'package:base_flutter_app/src/pages/sign_in_screen.dart';
import 'package:base_flutter_app/src/pages/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:lottie/lottie.dart';
import '../all_file_import/app_utils_files_link.dart';
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
                    duration: const Duration(seconds: 1),
                    child: Text(
                      appString.trans(context, appString.cafeText),
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
                buttonName: appString.trans(context, appString.signInButtonText),
                buttonHeight: 50,
                buttonBorderRadius: 12,
                isBottomMarginRequired: false,
                textStyle: appStyles.commonButtonTitleTextTextStyle(),
                backCallback: (){
                  Navigator.push(
                    context,
                    SlideRightRoute(
                        widget: SignInScreen()
                    ),
                  );
                /*    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                      return SignInScreen();
                    }), (route) => false);*/

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
                buttonName: appString.trans(context, appString.joinUsText),
                buttonHeight: 50,
                buttonBorderRadius: 12,
                isBottomMarginRequired: false,
                textStyle: appStyles.commonButtonTitleTextTextStyle(),
                backCallback: (){
                  Navigator.push(
                    context,
                    SlideRightRoute(
                        widget: SignUpScreen()
                    ),
                  );
                  /*Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return SignUpScreen();
                  }), (route) => false);*/
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

