import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';
import 'package:news_app_flutter_riverpod/features/explore/presentation/provider/explore_provider.dart';
import 'package:news_app_flutter_riverpod/core/common/widgets/custom_tab_view.dart';
import 'package:news_app_flutter_riverpod/features/explore/presentation/widgets/news_category.dart';
import 'package:news_app_flutter_riverpod/routes/app_router.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDark(context);
    List<String> tabs = [
      'Business',
      'Entertainment',
      'General',
      'Health',
      'Science',
      'Sports',
      'Technology',
    ];
    List<Widget> tabViews = [
      NewsCategory(category: businessProvider),
      NewsCategory(category: entertainmentProvider),
      NewsCategory(category: generalProvider),
      NewsCategory(category: healthProvider),
      NewsCategory(category: scienceProvider),
      NewsCategory(category: sportsProvider),
      NewsCategory(category: technologyProvider),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              context.push(AppRouter.search);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.h),
          Expanded(
            child: CustomTabView(
              indexProvider: tabIndexProvider,
              tabs: tabs,
              tabViews: tabViews,
            ),
          ),
        ],
      ),
    );
  }
}
