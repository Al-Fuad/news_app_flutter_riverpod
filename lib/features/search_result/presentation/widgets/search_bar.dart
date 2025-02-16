import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';
import 'package:news_app_flutter_riverpod/routes/app_router.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDark(context);
    final controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
          child: Row(children: [
            Expanded(
              child: TextField(
                style: GoogleFonts.schibstedGrotesk(
                  fontSize: 16.sp,
                ),
                controller: controller,
                decoration: InputDecoration(
                  hintText: "Search",
                  labelStyle: GoogleFonts.schibstedGrotesk(
                    fontSize: 16.sp,
                  ),
                  hintStyle: GoogleFonts.schibstedGrotesk(
                    fontSize: 16.sp,
                  ),
                  fillColor: isDark
                      ? const Color(0xFF1C1C1C)
                      : const Color(0xFFF0EFF0),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isDark
                          ? const Color(0xFF6C8CDE)
                          : const Color(0xFF577CD9),
                      width: 1,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF577CD9),
                      width: 1,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF577CD9),
                      width: 1,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFFCCCCCC),
                    size: 18,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.clear();
                    },
                    child: const Icon(
                      CupertinoIcons.clear_circled_solid,
                      color: Color(
                        0xFFCCCCCC,
                      ),
                      size: 18,
                    ),
                  ),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.push(AppRouter.searchResult, extra: value);
                  }
                },
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
