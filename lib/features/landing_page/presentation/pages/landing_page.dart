import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';
import 'package:news_app_flutter_riverpod/core/theme/app_theme.dart';
import 'package:news_app_flutter_riverpod/routes/app_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade900,
                    Colors.white,
                  ],
                ),
              ),
            ),
            Image.asset("assets/images/news_background.png"),
            Positioned.fill(
              top: 511.h,
              child: Container(
                padding: EdgeInsets.only(top: 52.h, left: 32.w, right: 32.w),
                decoration: BoxDecoration(
                  color: HelperFunction.isDark(context)
                      ? AppTheme.bgDark
                      : AppTheme.bgLight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Get The Latest News And Updates",
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      "From Politics to Entertainment: Your One-Stop Source for Comprehensive Coverage of the Latest News and Developments Across the Glob will be right on your hand.",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2D5BD0),
                        maximumSize: Size(145.w, 56.h),
                        minimumSize: Size(145.w, 56.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(128.r),
                        ),
                      ),
                      onPressed: () {
                        context.go(AppRouter.home);
                      },
                      child: Row(
                        children: [
                          const Text(
                            "Explore",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
