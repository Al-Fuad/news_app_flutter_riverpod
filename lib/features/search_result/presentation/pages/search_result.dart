import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app_flutter_riverpod/core/common/widgets/custom_tab_view.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';
import 'package:news_app_flutter_riverpod/core/theme/app_theme.dart';
import 'package:news_app_flutter_riverpod/features/search_result/presentation/provider/search_provider.dart';
import 'package:news_app_flutter_riverpod/features/search_result/presentation/widgets/filter_search.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.searchString});

  final String searchString;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDark(context);
    List<String> tabs = [
      'All',
      'Business',
      'Entertainment',
      'General',
      'Health',
      'Science',
      'Sports',
      'Technology',
    ];
    List<Widget> tabViews = [
      FilterSearch(
        category: allSearchProvider(searchString),
      ),
      FilterSearch(
        category: searchBusinessProvider(searchString),
      ),
      FilterSearch(
        category: searchEntertainmentProvider(searchString),
      ),
      FilterSearch(
        category: searchGeneralProvider(searchString),
      ),
      FilterSearch(
        category: searchHealthProvider(searchString),
      ),
      FilterSearch(
        category: searchScienceProvider(searchString),
      ),
      FilterSearch(
        category: searchSportsProvider(searchString),
      ),
      FilterSearch(
        category: searchTechnologyProvider(searchString),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64.h,
        backgroundColor: isDark ? AppTheme.bgDark : AppTheme.bgLight,
        title: Text(
          'Search results',
          style: TextStyle(
            color: isDark ? const Color(0xFFE0DCDD) : const Color(0xFF231F20),
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
            context.pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: isDark ? const Color(0xFFE0DCDD) : const Color(0xFF231F20),
          ),
        ),
      ),
      body: CustomTabView(
        indexProvider: tabIndexSearchProvider,
        tabs: tabs,
        tabViews: tabViews,
      ),
    );
  }
}
