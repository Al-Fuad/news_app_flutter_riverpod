import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_flutter_riverpod/features/bottom_nav/presentation/provider/bottom_nav_provider.dart';
import 'package:news_app_flutter_riverpod/features/bottom_nav/presentation/widgets/bottom_nav_button.dart';
import 'package:news_app_flutter_riverpod/features/explore/presentation/pages/explore.dart';
import 'package:news_app_flutter_riverpod/features/home/presentation/pages/home.dart';

class BottomNav extends ConsumerWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final icons = [
      Icons.home,
      CupertinoIcons.globe,
      Icons.bookmark,
      Icons.person,
    ];
    final labels = [
      'Home',
      'Explore',
      'Bookmarks',
      'Profile',
    ];
    final bodies = [
      const Home(),
      const Explore(),
      const Center(
        child: Text('Design Not Given'),
      ),
      const Center(
        child: Text('Design Not Given'),
      ),
    ];
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BlurryContainer(
        height: 80.h,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.r),
          topRight: Radius.circular(32.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
            (index) => BottomNavButton(
              selectedIndex: indexBottomNavbar,
              index: index,
              icon: icons[index],
              label: labels[index],
              onPressed: () => ref
                  .read(indexBottomNavbarProvider.notifier)
                  .update((state) => index),
            ),
          ),
        ),
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
