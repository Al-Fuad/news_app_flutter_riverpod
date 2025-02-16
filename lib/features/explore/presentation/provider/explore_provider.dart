import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_flutter_riverpod/features/explore/data/datasources/explore_remote_data_source_impl.dart';
import 'package:news_app_flutter_riverpod/features/explore/data/repositories/explore_repository_impl.dart';
import 'package:news_app_flutter_riverpod/features/explore/domain/usecases/get_explore_news.dart';

final tabIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final exploreRepositoryProvider = Provider<ExploreRepositoryImpl>((ref) {
  return ExploreRepositoryImpl(ExploreRemoteDataSourceImpl());
});

final getExploreProvider = Provider<GetExploreNews>((ref) {
  final repository = ref.watch(exploreRepositoryProvider);
  return GetExploreNews(repository);
});

final businessProvider = FutureProvider((ref) async {
  final usecase = ref.watch(getExploreProvider);
  final result = await usecase('business');
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final entertainmentProvider = FutureProvider((ref) async {
  final usecase = ref.watch(getExploreProvider);
  final result = await usecase('entertainment');
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final generalProvider = FutureProvider((ref) async {
  final usecase = ref.watch(getExploreProvider);
  final result = await usecase('general');
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final healthProvider = FutureProvider((ref) async {
  final usecase = ref.watch(getExploreProvider);
  final result = await usecase('health');
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final scienceProvider = FutureProvider((ref) async {
  final usecase = ref.watch(getExploreProvider);
  final result = await usecase('science');
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final sportsProvider = FutureProvider((ref) async {
  final usecase = ref.watch(getExploreProvider);
  final result = await usecase('sports');
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final technologyProvider = FutureProvider((ref) async {
  final usecase = ref.watch(getExploreProvider);
  final result = await usecase('technology');
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});
