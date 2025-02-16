import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';
import 'package:news_app_flutter_riverpod/features/home/presentation/provider/home_provider.dart';
import 'package:news_app_flutter_riverpod/features/home/presentation/widgets/news_card_list.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsyncValue = ref.watch(homeProvider);
    final isDark = HelperFunction.isDark(context);
    final now = HelperFunction.dateFormatter(DateTime.now());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning,\nTrung",
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                color: isDark
                    ? const Color(0xFF9B8A8F)
                    : const Color(
                        0xFF6D6265,
                      ),
              ),
            ),
            Text(
              now,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/sun.png",
                  width: 20.w,
                  height: 20.w,
                ),
                SizedBox(width: 16.w),
                Text(
                  "Sunny 32C",
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          )
        ],
      ),
      body: newsAsyncValue.when(
        data: (home) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 32.w, top: 24.h),
            child: Column(
              children: [
                NewsCardList(
                  news: home.technews,
                  category: 'Technology',
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 16.h, bottom: 16.h, right: 20.w),
                  child: Row(
                    children: [
                      Text(
                        'Just for you',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'See more',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                NewsCardList(
                  news: home.topNews,
                  category: 'Top News',
                ),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) =>
            const Center(child: Text('Error loading news')),
      ),
    );
  }
}
