import 'package:flutter/material.dart';
import 'package:kouizapp/constants/customcolors.dart';
import 'pages/patterns/tabbarwidget.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons));
    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static const String appName = 'Kouiz';
  final ThemeData theme = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(primary: CustomColors.mainPurple, secondary: CustomColors.mainPurple),
      ),
      home: Scaffold(
        body: SafeArea(
          child: TabBarWidget(),
        ),
        backgroundColor: CustomColors.white,
      )
    );
  }
}
