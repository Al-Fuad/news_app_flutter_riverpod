import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';

class CustomTabView extends ConsumerWidget {
  const CustomTabView({
    super.key,
    required this.tabs,
    required this.tabViews,
    required this.indexProvider,
  });

  // List of tab titles
  final List<String> tabs;
  // List of tab views corresponding to each tab
  final List<Widget> tabViews;
  // State provider to manage the index of the selected tab
  final StateProvider indexProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Determine if the current theme is dark
    final isDark = HelperFunction.isDark(context);
    // Watch the current tab index from the provider
    final tabIndex = ref.watch(indexProvider);
    return Column(
      children: [
        // Horizontal scrollable tab bar
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              tabs.length,
              (index) => GestureDetector(
                // Update the tab index when a tab is tapped
                onTap: () =>
                    ref.read(indexProvider.notifier).update((state) => index),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                  margin: EdgeInsets.only(left: 10.w, bottom: 24.h),
                  decoration: BoxDecoration(
                    // Change background color based on theme and selection
                    color: isDark
                        ? index == tabIndex
                            ? const Color(0xFF1A1A1A)
                            : null
                        : index == tabIndex
                            ? const Color(0xFFE9EEFA)
                            : null,
                    borderRadius: BorderRadius.circular(20.r),
                    // Change border based on theme and selection
                    border: isDark
                        ? index == tabIndex
                            ? null
                            : Border.all(
                                color: const Color(0xFF1A1A1A),
                              )
                        : index == tabIndex
                            ? null
                            : Border.all(
                                color: const Color(0xFFE9EEFA),
                                width: 1.w,
                              ),
                  ),
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Display the content of the selected tab
        Expanded(child: SingleChildScrollView(child: tabViews[tabIndex])),
      ],
    );
  }
}
