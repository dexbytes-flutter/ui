import 'dart:convert';
import 'package:base_flutter_app/src/all_file_import/app_screens_files_link.dart';
import 'package:base_flutter_app/src/all_file_import/app_values_files_link.dart';
import 'package:base_flutter_app/src/pages/sign_up_screen.dart';
import 'package:base_flutter_app/src/widgets/slider_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:base_flutter_app/src/all_file_import/app_providers_files_link.dart';
import 'package:base_flutter_app/src/api_calling/api_constant.dart';
import 'package:base_flutter_app/src/app_utility/app_localizations.dart';
import 'package:base_flutter_app/src/app_utility/project_util.dart';
import 'package:base_flutter_app/src/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:base_flutter_app/src/bloc/verification_code_bloc/verification_code_bloc.dart';
import 'package:base_flutter_app/src/helper/local_constant.dart';
import 'package:base_flutter_app/src/helper/shared_preferencesFile.dart';
import 'package:provider/provider.dart';
import 'package:base_flutter_app/src/config/routes.dart';

import 'src/pages/dashboard_screen.dart';
import 'src/pages/sign_in_screen.dart';

void main() async {
  // if you are using await in main function then add this line
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase Crashlytics
  await Firebase.initializeApp();
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // Pass all uncaught errors to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  Provider.debugCheckInvalidValueType = null;

  // Restrict for portrait mode only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  bool isLoggedIn = await sharedPreferencesFile.readBool(isUserLoggedInC);

  String jsonString =
      await rootBundle.loadString('assets/app_theme/config_theme.json');
  MainAppBloc.configTheme = json.decode(jsonString);

  String? loggedInUserDetails;
  if (isLoggedIn) {
    loggedInUserDetails =
        await sharedPreferencesFile.readStr(loggedInUserApiResponse);
    if (loggedInUserDetails.trim().isNotEmpty) {
      try {
        /*SignInModel signInModel;
        signInModel = SignInModel.fromJson(json.decode(loggedInUserDetails));
        String userId = signInModel.data.loginDetailModel.id;
        MainAppBloc mainAppBloc = MainAppBloc();
        mainAppBloc.add(UpdateLoggedInUserDetailsEvent(signInModel));
        await mainAppBloc.getUserProfileApi(userId: userId);
        profileSetUpScreens = await mainAppBloc.getProfileSetUpStep();*/
      } catch (e) {
        debugPrint("$e");
      }
    }
  }
  bool isTutorialSeen =
      await SharedPreferencesFile().readBool(isIsTutorialSeenC);
  bool isOneTimeProfileSetUpDone =
      await SharedPreferencesFile().readBool(isOneTimeProfileSetUpDoneC);
  Locale? mLocale = isLoggedIn ? await lang() : null;

  Provider.debugCheckInvalidValueType = null;
  return runApp(MyAppFlutterMain(
    isLoggedIn: isLoggedIn,
    loggedInUserDetails: loggedInUserDetails,
    locale: mLocale,
    isTutorialSeen: isTutorialSeen,
    isOneTimeProfileSetUpDone: isOneTimeProfileSetUpDone,
  ));
}

Future<Locale?> lang() async {
  Locale? mLocale = const Locale('en', 'US');
  String languageCode, countryCode;
  String value = await SharedPreferencesFile().readStr(languageCodeC);

  if (value != '') {
    Map localDetails = json.decode(value);
    languageCode = localDetails["languageCode"];
    countryCode = localDetails["countryCode"];
    if (languageCode != '' && countryCode != '') {
      mLocale = Locale(languageCode, countryCode);
    } else {
      mLocale = null;
    }
  }
  //First Time User
  else {
    mLocale = null;
    SharedPreferencesFile().saveStr(selectedLanguageC, selectedLanguageKoreanC);
    SharedPreferencesFile().saveBool(isNotFirstTime, true);
  }
  return mLocale;
}

class MyAppFlutterMain extends StatefulWidget {
  final bool isLoggedIn;
  final bool isTutorialSeen;
  final bool isOneTimeProfileSetUpDone;
  final Locale? locale;

  final String? loggedInUserDetails;

  const MyAppFlutterMain(
      {Key? key,
      this.isLoggedIn = false,
      this.isTutorialSeen = false,
      this.isOneTimeProfileSetUpDone = false,
      this.loggedInUserDetails,
      this.locale})
      : super(key: key);

  static void setLocale(BuildContext? context, Locale newLocale) async {
    _MyAppState? state = context!.findAncestorStateOfType<_MyAppState>();
    state!.changeLanguage(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppFlutterMain> {
  bool isCheckedLang = false;
  bool isInit = false;

  Locale _locale = const Locale('en', 'US');
  final Locale _localeDefult = const Locale('en', 'US');

  _MyAppState() {
    getLanguage();
  }

  var supportedLocales1 = const [
    Locale('en', 'US'),
    Locale('ko', 'KR'),
  ];

  @override
  void initState() {
    projectUtil.statusBarColor(
        statusBarColor: appColors.appStatusBarColor,
        isAppStatusDarkBrightness: false);
    try {
      //  versionCheck(context);
    } catch (e) {
      debugPrint("$e");
    }
    super.initState();
  }

  changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
      String languageCode = locale.languageCode;
      String? countryCode = locale.countryCode;
      var localDetails = {
        "languageCode": languageCode,
        "countryCode": countryCode
      };

      String localDetailsStr = jsonEncode(localDetails);
      SharedPreferencesFile().saveStr(languageCodeC, localDetailsStr);
    });
  }

  getLanguage() async {
    SharedPreferencesFile().readBool(isNotFirstTime).then((value) {
      if (value == false) {
        _locale = _localeDefult;
        SharedPreferencesFile()
            .saveStr(selectedLanguageC, selectedLanguageKoreanC);
        changeLanguage(_locale);
        SharedPreferencesFile().saveBool(isNotFirstTime, true);
      } else {
        String languageCode, countryCode;
        SharedPreferencesFile().readStr(languageCodeC).then((value) {
          if (value != '') {
            Map localDetails = json.decode(value);
            languageCode = localDetails["languageCode"];
            countryCode = localDetails["countryCode"];
            if (languageCode != '' && countryCode != '') {
              setState(() {
                _locale = Locale(languageCode, countryCode);
              });
            } else {
              setState(() {
                _locale = _localeDefult;
              });
            }
          }
        });
        //projectUtil.printP("main","language code2: $languageCode $countryCode");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.locale != null && !isInit) {
      setState(() {
        isInit = true;
        _locale = widget.locale!;
      });
    }
    projectUtil.statusBarColor();

    return MultiBlocProvider(
        providers: [
          BlocProvider<SignUpBloc>(
            create: (context) => SignUpBloc(),
          ),
          BlocProvider<MainAppBloc>(
            create: (context) => MainAppBloc(),
          ),
          BlocProvider<VerificationCodeBloc>(
            create: (context) => VerificationCodeBloc(),
          ),
          BlocProvider<SignInBloc>(
            create: (context) => SignInBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: !ConstantC.isProduction,
          title: 'Base App',
          // List all of the app's supported locales here
          supportedLocales: supportedLocales1,
          locale: _locale,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),

          // These delegates make sure that the localization data for the proper language is loaded
          localizationsDelegates: const [
            // THIS CLASS WILL BE ADDED LATER
            // A class which loads the translations from JSON files
            AppLocalizations.delegate,
            // Built-in localization of basic text for Material widgets
            GlobalMaterialLocalizations.delegate,
            // Built-in localization for text direction LTR/RTL
            GlobalWidgetsLocalizations.delegate,
          ],

          // Returns a locale which will be used by the app
          localeResolutionCallback: (locale, supportedLocales) {
            // Check if the current device locale is supported
            // If the locale of the device is not supported, use the first one
            // from the list (English, in this case).
            return supportedLocales.first;
          },
          home:
              !widget.isLoggedIn ? loginOptionScreen() : anotherLandingScreen(),
          //Routes File
          routes: Routes.route(),
          onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
          onUnknownRoute: (settings) => Routes.onUnknownRoute(settings),
        ));
  }

  mainLandingScreen() {}

  //Redirect to login screen in case user not loggedIn
  loginOptionScreen() {
    return /*!widget.isOneTimeProfileSetUpDone
        ? CreateAccount()
        : */
        //SignUpPage
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderScreen(
              urlImages: ["https://images.wallpapersden.com/image/download/landscape-pixel-art_bGhnaGeUmZqaraWkpJRmbmdlrWZlbWU.jpg",
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNEegapBEz-TgsTk0wdHwoERShihEq2cyWWSsTtxP5LGVhrWG-jUhY2FteEwnKin-9EmE&usqp=CAU",
              "https://www.marketing91.com/wp-content/uploads/2019/05/Features-of-advertising-1.jpg",
              "https://www.wallpaperup.com/uploads/wallpapers/2019/06/27/1328160/888061e927e72ea9b44968a1a829d57c-700.jpg"],
              imageHeight: 70,
            ),
          ],
        );
  }

  //Redirect to another screen if already loggedIn
  anotherLandingScreen() {
    //Redirect to tutorial screen if not finished
    // return StartOneToOneChatScreen();

    //If profile set done by user
    // if (widget.isOneTimeProfileSetUpDone) {
    // return const SignInScreen();
    return const DashboardScreen();
    // return const SplashScreen();
    // return const SignUpScreen();
    //SignInPage();
    // }
    //If set up not done by user than redirect to selected screen
    /*if (widget.isTutorialSeen &&
        widget.loggedInUserDetails != null &&
        widget.loggedInUserDetails!.trim().isNotEmpty) {}*/
  }
}
