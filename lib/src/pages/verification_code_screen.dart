import 'package:base_flutter_app/src/all_file_import/app_utils_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_widget_files_link.dart';
import 'package:base_flutter_app/src/pages/registration_screen.dart';
import 'package:base_flutter_app/src/widgets/appbar/common_app_bar.dart';
import 'package:base_flutter_app/src/widgets/pin_code_fields.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'reset_password_screen.dart';
import 'terms_of_services_screen.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String selectedContactDetail;
  const VerificationCodeScreen({
    Key? key,
    required this.selectedContactDetail
  }) : super(key: key);

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {

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
                              SlideRightRoute(widget: RegistrationScreen()),
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


    return ContainerFirst(
      appBarHeight: 85,
      isOverLayStatusBar: true,
      isSingleChildScrollViewNeed: false,
      contextCurrentView: context,
      appBar: CommonAppBar(
        appBarRowMargin: EdgeInsets.only(top: 50,left: 20,right: 20),
        isHideRightIcon: true,
      ),
      containChild: Container(
        margin: const EdgeInsets.only(left: 20,right: 20,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text(appString.trans(context, appString.verifyYourIdentityText),
                style: appStyles.commonTitleStyle(fontSize: 30)),
            SizedBox(height: 15,),
            Text(appString.trans(context, appString.verificationSubTitleText),
                style: appStyles.alreadyHaveAccountTextStyle(fontSize: 15)),
            SizedBox(height: 5,),
            Text(widget.selectedContactDetail,
                style: appStyles.alreadyHaveAccountTextStyle(fontSize: 15)
            ),
            SizedBox(height: 30,),
            verificationCode(),
            otpErrorMsg,
            SizedBox(height: 5,),
            Center(child: didNotReceivedCode()),
          ],
        ),
      ),
      bottomMenuView: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
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
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    SlideRightRoute(widget: ResetPasswordScreen()),
                  );
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
