import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/routes/app_router.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.news,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Navigate to the article page when the tile is tapped
      onTap: () {
        context.push(AppRouter.article, extra: news);
      },
      child: SizedBox(
        width: 80.w,
        child: Row(
          children: [
            SizedBox(
              width: 238.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the news title
                  Text(
                    news.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      // Display the author's avatar
                      CircleAvatar(
                        radius: 10.r,
                        child: Image.asset(
                          "assets/icons/avatar.png",
                        ),
                      ),
                      SizedBox(width: 8.w),
                      // Display the author's name
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 110.w),
                        child: Text(
                          news.author,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      // Display the publication date
                      Text(
                        " • ${news.publishedAt.split("T")[0]}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 16.w),
            // Display the news image
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                news.urlToImage,
                width: 112.w,
                height: 80.h,
                fit: BoxFit.cover,
                // Show a loading indicator while the image is loading
                loadingBuilder: (context, child, loadingProgress) =>
                    loadingProgress == null
                        ? child
                        : const CircularProgressIndicator(),
                // Show a placeholder image if the image fails to load
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  width: 112.w,
                  height: 80.h,
                  "assets/images/placeholder.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
