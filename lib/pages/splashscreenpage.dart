import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  final int? seconds;
  final Object? navigateAfterSeconds;
  final Image? image;

  final Route? pageRoute;

  final String? routeName;

  final Future<Object>? navigateAfterFuture;

  /// Use one of the provided factory constructors instead of.
  @protected
  SplashScreenPage({Key? key,
    this.navigateAfterFuture,
    this.seconds,
    this.pageRoute,
    this.navigateAfterSeconds,
    this.image,
    this.routeName,
  })  : assert(
  routeName == null ||
      (routeName is String && routeName.startsWith('/')),
  'routeName must be a String beginning with forward slash (/)',
  ),
        assert(
        navigateAfterFuture == null ||
            navigateAfterFuture is Future<String> ||
            navigateAfterFuture is Future<Widget>,
        'navigateAfterFuture must be a Future<String> or Future<Widget>',
        ),
        assert(
        navigateAfterFuture != null || seconds != null,
        'navigateAfterFuture and seconds cant be null at the same time',
        ),
        assert(
        navigateAfterFuture != null ||
            navigateAfterSeconds is String ||
            navigateAfterSeconds is Widget,
        'navigateAfterSeconds must either be a String or Widget',
        ),
        assert(
        navigateAfterSeconds is! String ||
            (navigateAfterSeconds is String &&
                navigateAfterSeconds.startsWith('/')),
        'navigateAfterSeconds must be a String beginning with forward slash (/)',
        ), super(key: key);

  factory SplashScreenPage.timer({
    required int seconds,
    Image? image,
    Route? pageRoute,
    Object? navigateAfterSeconds,
    String? routeName,
  }) =>
      SplashScreenPage(
        seconds: seconds,
        image: image,
        pageRoute: pageRoute,
        navigateAfterSeconds: navigateAfterSeconds,
        routeName: routeName,
      );

  factory SplashScreenPage.future({
    required Future<Object> navigateAfterFuture,
    Image? image,
    Route? pageRoute,
    dynamic navigateAfterSeconds,
    String? routeName,
  }) =>
      SplashScreenPage(
        navigateAfterFuture: navigateAfterFuture,
        image: image,
        pageRoute: pageRoute,
        navigateAfterSeconds: navigateAfterSeconds,
        routeName: routeName,
      );

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {

  @override
  void initState() {
    super.initState();
    if (widget.navigateAfterFuture == null) {
      Timer(Duration(seconds: widget.seconds!), () {
        if (widget.navigateAfterSeconds is String) {
          // It's fairly safe to assume this is using the in-built material
          // named route component
          Navigator.of(context).pushReplacementNamed(
            widget.navigateAfterSeconds as String,
          );
        } else if (widget.navigateAfterSeconds is Widget) {
          Navigator.of(context).pushReplacement(
            widget.pageRoute != null
                ? widget.pageRoute!
                : MaterialPageRoute(
              settings: widget.routeName != null
                  ? RouteSettings(name: widget.routeName)
                  : null,
              builder: (context) => widget.navigateAfterSeconds as Widget,
            ),
          );
        }
      });
    } else {
      widget.navigateAfterFuture!.then((navigateTo) {
        if (navigateTo is String) {
          // It's fairly safe to assume this is using the in-built material
          // named route component
          Navigator.of(context).pushReplacementNamed(navigateTo);
        } else if (navigateTo is Widget) {
          Navigator.of(context).pushReplacement(
            widget.pageRoute != null
                ? widget.pageRoute!
                : MaterialPageRoute(
                settings: widget.routeName != null
                    ? RouteSettings(name: widget.routeName)
                    : null,
                builder: (context) => navigateTo),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: widget.image!.image,
                  fit: BoxFit.cover,
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}