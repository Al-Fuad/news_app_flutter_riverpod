import 'package:go_router/go_router.dart';
import 'package:news_app_flutter_riverpod/features/article/presentation/pages/article.dart';
import 'package:news_app_flutter_riverpod/features/bottom_nav/presentation/pages/bottom_nav.dart';
import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';
import 'package:news_app_flutter_riverpod/features/landing_page/presentation/pages/landing_page.dart';
import 'package:news_app_flutter_riverpod/features/search_result/presentation/widgets/search_bar.dart';
import 'package:news_app_flutter_riverpod/features/search_result/presentation/pages/search_result.dart';
import 'package:news_app_flutter_riverpod/features/splash/presentation/pages/splash.dart';

class AppRouter {
  static const String splash = '/splash';
  static const String landingPage = '/landingPage';
  static const String home = '/';
  static const String article = '/article';
  static const String search = '/search';
  static const String searchResult = '/searchResult';

  static GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: home, builder: (context, state) => const BottomNav()),
      GoRoute(path: splash, builder: (context, state) => const Splash()),
      GoRoute(
          path: landingPage, builder: (context, state) => const LandingPage()),
      GoRoute(
        path: article,
        builder: (context, state) => Article(
          news: state.extra! as NewsEntity,
        ),
      ),
      GoRoute(
        path: search,
        builder: (context, state) => const SearchBar(),
      ),
      GoRoute(
        path: searchResult,
        builder: (context, state) => SearchResult(
          searchString: state.extra! as String,
        ),
      ),
    ],
  );
}
