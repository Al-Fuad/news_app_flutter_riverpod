import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';
import 'package:news_app_flutter_riverpod/core/theme/app_theme.dart';
import 'package:news_app_flutter_riverpod/features/article/presentation/provider/article_provider.dart';

class Article extends ConsumerWidget {
  const Article({
    super.key,
    required this.news,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clapped = ref.watch(clappedProvider);
    final bookmarked = ref.watch(bookmarkedProvider);
    final isDark = HelperFunction.isDark(context);
    return Scaffold(
        extendBody: true,
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Image.network(
                  news.urlToImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 316.h,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : const CircularProgressIndicator(),
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    "assets/images/placeholder.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 316.h,
                  ),
                ),
                Positioned.fill(
                  top: 269.h,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 32.w, right: 32.w, top: 24.h),
                    decoration: BoxDecoration(
                      color: isDark ? AppTheme.bgDark : AppTheme.bgLight,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.r),
                        topRight: Radius.circular(32.r),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            news.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              CircleAvatar(
                                child: Image.asset("assets/icons/avatar.png"),
                              ),
                              SizedBox(width: 8.w),
                              Flexible(
                                child: Text(
                                  "${news.author} • ${news.publishedAt.substring(0, 10)}",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          Text(
                            news.content,
                            style: GoogleFonts.merriweather(
                              fontSize: 16.sp,
                              color: isDark
                                  ? const Color(0xFFE0DCDD)
                                  : const Color(0xFF231F20),
                            ),
                          ),
                          SizedBox(
                            height: 68.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlurryContainer(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
          height: 68.h,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: const Icon(Icons.arrow_back),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  ref.read(clappedProvider.notifier).update((state) => !state);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Image.asset(
                    clapped
                        ? "assets/icons/hands_clapping_filled.png"
                        : "assets/icons/hands_clapping.png",
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              GestureDetector(
                onTap: () {
                  ref
                      .read(bookmarkedProvider.notifier)
                      .update((state) => !state);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Icon(
                    bookmarked ? Icons.bookmark : Icons.bookmark_outline,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              GestureDetector(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Icon(
                    Icons.share,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
