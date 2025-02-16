import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_flutter_riverpod/core/common/widgets/custom_error_widget.dart';
import 'package:news_app_flutter_riverpod/core/common/widgets/custom_loading_widget.dart';
import 'package:news_app_flutter_riverpod/core/common/widgets/news_tile.dart';
import 'package:news_app_flutter_riverpod/features/explore/presentation/widgets/top_news.dart';

class NewsCategory extends ConsumerWidget {
  const NewsCategory({
    super.key,
    required this.category,
  });

  final FutureProvider category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(category);
    return asyncValue.when(
      data: (news) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopNews(news: news[0]),
              SizedBox(
                height: 24.h,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: news.length - 1,
                separatorBuilder: (context, index) => SizedBox(height: 24.h),
                itemBuilder: (context, index) =>
                    NewsTile(news: news[index + 1]),
              ),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => const CustomErrorWidget(),
      loading: () => const CustomLoadingWidget(),
    );
  }
}
