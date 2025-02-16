import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';
import 'package:news_app_flutter_riverpod/core/theme/app_theme.dart';
import 'package:news_app_flutter_riverpod/routes/app_router.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDark(context);
    return FlutterSplashScreen.fadeIn(
      backgroundColor: isDark ? AppTheme.bgDark : AppTheme.bgLight,
      onEnd: () {
        context.go(AppRouter.landingPage);
      },
      childWidget: Image.asset("assets/icons/Lask.png"),
    );
  }
}
