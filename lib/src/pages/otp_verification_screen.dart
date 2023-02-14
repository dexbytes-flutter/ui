import 'dart:async';

import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';
import 'package:base_flutter_app/src/helper/shared_preferencesFile.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/pin_code_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../all_file_import/app_providers_files_link.dart';
import 'dashboard_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final bool isSignInScreen;
  final bool isLoggedIn;
  const OtpVerificationScreen({
    Key? key, this.isSignInScreen = false,
    this.isLoggedIn = false,
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState(isSignInScreen : this.isSignInScreen);
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool isSignInScreen = false;
  _OtpVerificationScreenState({required this.isSignInScreen});

  TextEditingController inputController = new TextEditingController();
  String verificationCodeStr = "";

  int otpLength = 4;
  bool isLoggedIn = false;

  String errorMessage = '';
  bool isHeight = true;
  OverlayEntry? overlayEntry;

  int secondsRemaining = 30;
  bool enableResend = false;
  Timer? timer;

  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  void _resendCode() {
    //other code here
    setState((){
      secondsRemaining = 30;
      enableResend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    MainAppBloc mainAppBloc = MainAppBloc();

    _topView() {
      return Stack(
        children: [
          ShaderMask(
            shaderCallback: (bound) =>LinearGradient(
              colors: [Colors.black.withOpacity(0.3),Colors.black.withOpacity(0.3)],
              begin:Alignment.topRight,
              end: Alignment.bottomRight,
            ).createShader(bound),
            blendMode: BlendMode.darken,
            child: CachedNetworkImage(
              height: MediaQuery.of(context).size.height/2.0,
              width: MediaQuery.of(context).size.width,
              imageUrl: "https://i.pinimg.com/736x/dd/bb/0c/ddbb0c5380af987cb41caacb6f374a07.jpg",
              fit:BoxFit.cover,
            ),
          ),
          Positioned(
            left: 5,
            child: SafeArea(
              child: CommonAppBar(
                isHideLeftIcon: false,
                isHideRightICon: true,
              ),
            ),
          )
        ],
      );
    }

    _welcomeTextView() {
      return Container(
          padding: EdgeInsets.only(
            left: 30,
            right: 15,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appString.trans(context, appString.enterOtpText),
                style: appStyles.homeMenuTopTitleTextStyle(fontSize: 22,fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10,
              ),
              Text(appString.trans(context, appString.otpInstructionText),
                style: appStyles.commonCardTitleTextStyle(texColor: Colors.grey.shade500),
                textAlign: TextAlign.start,
              )
            ],
          ));
    }


    bottomButton(){
      return Container(
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 15),
        child: CommonButton(
          buttonName: appString.trans(context, appString.submitButtonText),
          buttonHeight: 50,
          buttonBorderRadius: 12,
          isBottomMarginRequired: false,
          textStyle: appStyles.commonButtonTitleTextTextStyle(),
          backCallback: (){
            if (verificationCodeStr != '' && verificationCodeStr.trim().length == otpLength) {
              setState(() {
                errorMessage = '';
                if(isSignInScreen){
                  sharedPreferencesFile.saveBool(isUserLoggedInC, true);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return DashboardScreen();
                  }), (route) => false);
                } else{
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                    return DashboardScreen();
                  }), (route) => false);
                }
              });
            }else{
              setState(() {
                if( verificationCodeStr == '')
                  errorMessage = appString.pleaseEnterOTP;
                else
                  errorMessage = appString.pleaseEnterCorrectOTP;
              });
            }
          },
        ),
      );
    }


    resendCode(){
      return Container(
        margin: EdgeInsets.only(left: 0,right: 0,bottom: 20),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              enableResend ? _resendCode : null;
            },
            child: Center(
              child: enableResend ? Text(
                 appString.trans(context, appString.resendText),
                style: appStyles.commonCardTitleTextStyle(texColor: Colors.grey.shade500),
              ): Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(appString.trans(context, appString.resendCodeInText), style: appStyles.commonCardTitleTextStyle(texColor: Colors.grey.shade500),),
                Text("$secondsRemaining",
                style: appStyles.commonCardTitleTextStyle(texColor: Colors.grey.shade500),
                )
              ],),
            ),
          ),
        ),
      );
    }


    verificationCode() {
      Color fieldBackgroundColor = Color(0xFF5D3F30).withOpacity(0.1);
      Color activeBorderColor = Color(0xFF5D3F30).withOpacity(0.1);
      Color activeBackgroundColor = Color(0xFF5D3F30).withOpacity(0.1);
      Color borderColor = Color(0xFF5D3F30).withOpacity(0.1);
      return Container(
        // color: Colors.red,
          margin: EdgeInsets.only(bottom: 0, top: 0),
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 2),
          child: PinCodeFields(
            controller: inputController,
            length: otpLength,
            margin: EdgeInsets.only(left: 10,right:10,top: MediaQuery.of(context).size.height/22),
            fieldBorderStyle: FieldBorderStyle.Square,
            responsive: false,
            fieldHeight: 44.0,
            fieldWidth: 44.0,
            borderWidth: 1.0,
            activeBorderColor: activeBorderColor,
            activeBackgroundColor: activeBackgroundColor,
            borderRadius: BorderRadius.circular(5.0),
            keyboardType: TextInputType.number,
            autoHideKeyboard: true,
            autofocus: false,
            fieldBackgroundColor: fieldBackgroundColor,
            borderColor: borderColor,
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            onChange: (value) {
              verificationCodeStr = "$value";
              print(value + "### $verificationCodeStr");
            },
            onComplete: (output) {
              //setState(() {
              verificationCodeStr = output;
              if (verificationCodeStr != "" &&
                  verificationCodeStr.length == otpLength) {
                setState(() {
                  errorMessage = '';
                });
                FocusScope.of(context).requestFocus(FocusNode());

              }
              // });
              // Your logic with pin code
              print(output + "Final $verificationCodeStr");
            },
          ));
    }



    Widget otpErrorMsg = (errorMessage != '')
        ? Container(
        height: 24,
        child: Padding(
          padding: EdgeInsets.only(top: 2.0, left: 3),
          child: Text(
            errorMessage,
            style: appStyles.errorStyle(),
          ),
        ))
        : Container(
      height: 24,
    );



    // Bottom card view
    Widget bottomCardView =  Positioned(
      top: MediaQuery.of(context).size.height/2.15,
      child: Container(
        padding: EdgeInsets.only(top: 35),
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          // color: Color(0xff212327),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _welcomeTextView(),
            verificationCode(),
            otpErrorMsg,
            resendCode(),
            Align(
                alignment: Alignment.bottomCenter,
                child: bottomButton())
          ],
        ),
      ),
    );


    return ContainerFirst(
      contextCurrentView: context,
      isOverLayAppBar: true,
      isSingleChildScrollViewNeed: false,
      isFixedDeviceHeight: true,
      isOverLayStatusBar: true,
      appBarHeight: -1,
      containChild: Container(
        height: size.height,
        width: size.height,
        child: Stack(
          children: [
            _topView(),
            bottomCardView,
          ],
        ),
      ),
    );
  }
  //for ios done button callback
  onPressCallback() {
    removeOverlay();
    FocusScope.of(context);
  }

  //for keyboard done button
  showOverlay(BuildContext context) {
    if (overlayEntry != null) return;
    OverlayState overlayState = Overlay.of(context)!;
    overlayEntry = OverlayEntry(builder: (context) {
      return Positioned(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 0.0,
          left: 0.0,
          child: InputDoneView(
            onPressCallback: onPressCallback,
            buttonName: appString.trans(context, appString.doneText),
          ));
    });

    overlayState.insert(overlayEntry!);
  }

  removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }
}