import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_flutter_riverpod/core/common/widgets/custom_error_widget.dart';
import 'package:news_app_flutter_riverpod/core/common/widgets/custom_loading_widget.dart';
import 'package:news_app_flutter_riverpod/core/common/widgets/news_tile.dart';

class FilterSearch extends ConsumerWidget {
  const FilterSearch({
    super.key,
    required this.category,
  });

  final FutureProvider category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final news = ref.watch(category);
    return news.when(
        data: (news) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: news.length,
                separatorBuilder: (context, index) => SizedBox(height: 24.h),
                itemBuilder: (context, index) => NewsTile(news: news[index]),
              ),
            ),
        error: (error, stackTrace) => const CustomErrorWidget(),
        loading: () => const CustomLoadingWidget());
  }
}
