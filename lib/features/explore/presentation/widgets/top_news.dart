import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/routes/app_router.dart';

class TopNews extends StatelessWidget {
  const TopNews({
    super.key,
    required this.news,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.article, extra: news);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              news.urlToImage,
              width: 366.h,
              height: 206.h,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
                  loadingProgress == null
                      ? child
                      : const CircularProgressIndicator(),
              errorBuilder: (context, error, stackTrace) => Image.asset(
                "assets/images/placeholder.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            news.title,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              CircleAvatar(
                child: Image.asset("assets/icons/avatar.png"),
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: Text(
                  "${news.author} • ${news.publishedAt.split('T')[0]}",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 19.h,
          ),
        ],
      ),
    );
  }
}
