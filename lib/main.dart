import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'package:kouizapp/pages/patterns/auth/loginpage.dart';
import 'package:kouizapp/pages/patterns/auth/signuppage.dart';
import 'package:kouizapp/pages/splashscreenpage.dart';
import 'pages/patterns/main/mainpage.dart';
import 'package:flutter/services.dart';

void main() {
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

    // <fetch data from server. ex. login>

    return Future.value(LoginPage());
    //return Future.value(const MainPage());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.appName,
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: CustomColors.mainPurple, secondary: CustomColors.mainPurple),
      ),
      home: Scaffold(
        body: SafeArea(
          child: SplashScreenPage(
              navigateAfterFuture: loadFromFuture(),
              image: Image.asset('assets/images/splash.png'),
          ),
        ),
        backgroundColor: CustomColors.white,
      ),
      routes: {
        '/main': (context) => const MainPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
      }
    );
  }
}
