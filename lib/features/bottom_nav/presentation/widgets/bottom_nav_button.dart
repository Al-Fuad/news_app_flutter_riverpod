import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_flutter_riverpod/core/helpers/helper_function.dart';

class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    super.key,
    required this.selectedIndex,
    required this.index,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final int selectedIndex;
  final int index;
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDark = HelperFunction.isDark(context);
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: isDark
            ? (selectedIndex == index)
                ? const Color(0xFFE0DCDD)
                : Colors.transparent
            : (selectedIndex == index)
                ? Colors.black
                : Colors.transparent,
      ),
      icon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Row(
          children: [
            Icon(
              icon,
              color: isDark
                  ? (selectedIndex == index)
                      ? Colors.black
                      : const Color(0xFFE0DCDD)
                  : (selectedIndex == index)
                      ? Colors.white
                      : const Color(0xFF231F20),
            ),
            if (selectedIndex == index)
              const SizedBox(
                width: 8,
              ),
            if (selectedIndex == index)
              Text(
                label,
                style: TextStyle(
                  color: isDark ? Colors.black : Colors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
