import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/errors/loginrequiredexception.dart';
import 'package:kouizapp/pages/patterns/auth/confirmsignupkouiz.dart';
import 'package:kouizapp/pages/patterns/auth/loginkouizpage.dart';
import 'package:kouizapp/pages/patterns/auth/loginpage.dart';
import 'package:kouizapp/pages/patterns/auth/signupkouizpage.dart';
import 'package:kouizapp/pages/patterns/auth/signuppage.dart';
import 'package:kouizapp/pages/splashscreenpage.dart';
import 'package:kouizapp/services/auth_cognito.dart' as auth;
import 'pages/patterns/main/mainpage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons));
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String appName = 'Kouiz';

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData theme = ThemeData();

  Future<Widget> loadFromFuture() async {
    try {
      //Try to get User object
      await auth.getUser();
      return Future.value(const MainPage());
    } on LoginRequiredException catch (e) {
      //Unable to find User so login is required
      return Future.value(LoginPage());
    } catch(e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.appName,
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('fr', ''), // French, no country code
      ],
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: CustomColors.mainPurple, secondary: CustomColors.mainPurple),
        backgroundColor: CustomColors.fakeWhite,
      ),
      home: Scaffold(
        body: SafeArea(
          child: SplashScreenPage(
              navigateAfterFuture: loadFromFuture(),
              image: Image.asset('assets/images/splash.png'),
          ),
        ),
        backgroundColor: CustomColors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      ),
      routes: {
        '/main': (context) => const MainPage(),
        '/login': (context) => LoginPage(),
        '/loginWithKouiz': (context) => LoginKouizPage(),
        '/signup': (context) => SignUpPage(),
        '/signupWithKouiz': (context) => SignUpKouizPage(),
        '/confirmSignupWithKouiz': (context) => ConfirmSignUpKouizPage(),
      }
    );
  }
}
