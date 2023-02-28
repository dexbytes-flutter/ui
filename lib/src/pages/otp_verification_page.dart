import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/login_screen.dart';
import 'package:base_flutter_app/src/pages/register_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/pin_code_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'terms_of_services_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {

  String errorMessage = '';
  TextEditingController inputController = new TextEditingController();
  String verificationCodeStr = "";
  int otpLength = 4;
  OverlayEntry? overlayEntry;
  int secondsRemaining = 30;
  bool enableResend = false;


  
  @override
  Widget build(BuildContext context) {
    AppDimens appDimens = AppDimens();
    appDimens.appDimensFind(context: context);

    Widget otpErrorMsg = (errorMessage != '')
        ? Center(
          child: Container(
          height: 24,
          child: Padding(
            padding: EdgeInsets.only(top: 5, left: 3),
            child: Text(
              errorMessage,
              style: appStyles.errorStyle(),
            ),
          )),
        )
        : Container(
      height: 24,
    );

    verificationCode() {
      Color fieldBackgroundColor = appColors.appBgColorJungleGreen;
      Color activeBorderColor = appColors.appBgColor1.withOpacity(0.40);
      Color activeBackgroundColor = appColors.appBgColorJungleGreen;
      Color borderColor = appColors.appBgColor1.withOpacity(0.40);
      return Container(
          child: PinCodeFields(
            controller: inputController,
            length: otpLength,
            margin: EdgeInsets.only(left: 5,right:5,top: MediaQuery.of(context).size.height/20),
            fieldBorderStyle: FieldBorderStyle.Bottom,
            responsive: true,
            fieldHeight: 30.0,
            fieldWidth: 65,
            borderWidth: 2.5,
            activeBorderColor: activeBorderColor,
            activeBackgroundColor: activeBackgroundColor,
            keyboardType: TextInputType.number,
            autoHideKeyboard: true,
            autofocus: false,
            fieldBackgroundColor: fieldBackgroundColor,
            borderColor: borderColor,
            textStyle: appStyles.otpFieldTextStyle(),
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


    // Background Image widget
    Widget backgroundImage() {
      return Stack(
        children: [
          ShaderMask(
            shaderCallback: (rectangle) => LinearGradient(
              colors: [
                appColors.appTransColor,
                appColors.appBgColorJungleGreen
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(Rect.fromLTRB(0, 0, rectangle.width, rectangle.height)),
            blendMode: BlendMode.darken,
            child: CachedNetworkImage(
              height: appDimens.heightFullScreen() / 3.15,
              width: appDimens.widthFullScreen(),
              imageUrl:
              "https://www.plataran.com/wp-content/uploads/2020/04/plataran-bimonthly-may-june-2019-lr-15_0ztqu.jpg",
              fit: BoxFit.fill,
            ),
          ),
          CommonAppBar(
            leftIconMargin: EdgeInsets.only(top: 22, left: 20),
            isHideRightIcon: true,
            title: "Bali Indonesia",
          ),
        ],
      );
    }

    // Resend Text widget
    Widget didNotReceivedCode(){
      return RichText(
        text: TextSpan(
            text: appString.trans(context, appString.didNotReceivedCode),
            style: appStyles.alreadyHaveAccountTextStyle(),
            children: <InlineSpan>[
              WidgetSpan(
                  child: SizedBox(
                    width: 5,
                  )),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    /*Navigator.push(
                              context,
                              SlideRightRoute(widget: RegisterScreen()),
                            );*/
                  },
                text:
                appString.trans(context, appString.resendCodeText),
                style: appStyles.alreadyHaveAccountTextStyle(
                    texColor: appColors.buttonBgColor,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700),
              )
            ]),
      );
    }

    // Terms and conditions
    Widget termsAndConditions(){
      return RichText(
        text: TextSpan(
            text: appString.trans(context, appString.byRegisteringYouAreAgreeText),
            style: appStyles.alreadyHaveAccountTextStyle(),
            children: <InlineSpan>[
              WidgetSpan(
                  child: SizedBox(
                    width: 5,
                  )),
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      SlideRightRoute(widget: TermsOfServicesScreen()),
                    );
                  },
                text:
                appString.trans(context, appString.termsOfServices),
                style: appStyles.alreadyHaveAccountTextStyle(
                    texColor: appColors.buttonBgColor,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700),
              )
            ]),
      );
    }

    // Center view widget
    Widget bottomView() {
      return Container(
        color: appColors.appBgColorJungleGreen,
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(appString.trans(context, appString.verifyYourIdentityText),
                  style: appStyles.commonTitleStyle(fontSize: 30)),
              SizedBox(height: 15,),
              Text(appString.trans(context, appString.verificationSubTitleText),
                  style: appStyles.alreadyHaveAccountTextStyle(fontSize: 15)),
              SizedBox(height: 5,),
              Text("johndoe@gmail.com",
                  style: appStyles.alreadyHaveAccountTextStyle(fontSize: 15)
              ),
              SizedBox(height: 10,),
              verificationCode(),
              otpErrorMsg,
              SizedBox(height: 5,),
              Center(child: didNotReceivedCode()),
              SizedBox(height: 35,),
              Container(
                child: CommonButton(
                  buttonName: appString.trans(context, appString.verificationText),
                  buttonHeight: 50,
                  buttonBorderRadius: 18,
                  isBottomMarginRequired: false,
                  textStyle: appStyles.buttonNameStyle(),
                  backCallback: () {
                    if (verificationCodeStr != '' && verificationCodeStr.trim().length == otpLength) {
                      setState(() {
                        errorMessage = '';
                        Navigator.push(
                          context,
                          SlideRightRoute(widget: SignInScreen()),
                        );
                        /*if(isSignInScreen){
                          sharedPreferencesFile.saveBool(isUserLoggedInC, true);
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                            return DashboardScreen();
                          }), (route) => false);
                        } else{
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context){
                            return DashboardScreen();
                          }), (route) => false);
                        }*/
                      });
                    }else{
                      setState(() {
                        if( verificationCodeStr == '')
                          errorMessage = appString.trans(context, appString.pleaseEnterOtp);
                        else
                          errorMessage = appString.trans(context, appString.pleaseEnterCorrectOtp);
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 20,),
              termsAndConditions(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      );
    }

    return ContainerFirst(
      appBarHeight: -1,
      isOverLayStatusBar: true,
      statusBarColor: Colors.white,
      isSingleChildScrollViewNeed: false,
      contextCurrentView: context,
      containChild: ShaderMask(
        shaderCallback: (bound) => LinearGradient(
          colors: [
            appColors.appTransColor.withOpacity(0.20),
            appColors.appBgColorJungleGreen.withOpacity(0.60)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).createShader(bound),
        blendMode: BlendMode.darken,
        child: Column(
          children: [
            backgroundImage(),
            bottomView()
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
            buttonName: appString.trans(context, appString.doneButtonText),
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
