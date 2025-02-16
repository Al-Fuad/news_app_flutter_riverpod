import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_flutter_riverpod/features/search_result/data/datasources/search_result_remote_data_source_impl.dart';
import 'package:news_app_flutter_riverpod/features/search_result/data/repositories/search_result_repository_impl.dart';
import 'package:news_app_flutter_riverpod/features/search_result/domain/usecases/get_search_result.dart';

final tabIndexSearchProvider = StateProvider<int>((ref) {
  return 0;
});

final searchRepositoryProvider = Provider<SearchResultRepositoryImpl>((ref) {
  return SearchResultRepositoryImpl(SearchResultRemoteDataSourceImpl());
});

final getSearchProvider = Provider<GetSearchResult>((ref) {
  final repository = ref.watch(searchRepositoryProvider);
  return GetSearchResult(repository);
});

final searchBusinessProvider = FutureProvider.family((ref, String query) async {
  final usecase = ref.watch(getSearchProvider);
  final result = await usecase('business', query);
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final searchEntertainmentProvider = FutureProvider.family((ref, String query) async {
  final usecase = ref.watch(getSearchProvider);
  final result = await usecase('entertainment', query);
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final searchGeneralProvider = FutureProvider.family((ref, String query) async {
  final usecase = ref.watch(getSearchProvider);
  final result = await usecase('general', query);
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final searchHealthProvider = FutureProvider.family((ref, String query) async {
  final usecase = ref.watch(getSearchProvider);
  final result = await usecase('health', query);
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final searchScienceProvider = FutureProvider.family((ref, String query) async {
  final usecase = ref.watch(getSearchProvider);
  final result = await usecase('science', query);
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final searchSportsProvider = FutureProvider.family((ref, String query) async {
  final usecase = ref.watch(getSearchProvider);
  final result = await usecase('sports', query);
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final searchTechnologyProvider = FutureProvider.family((ref, String query) async {
  final usecase = ref.watch(getSearchProvider);
  final result = await usecase('technology', query);
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});

final allSearchProvider = FutureProvider.family((ref, String query) async {
  final usecase = ref.watch(getSearchProvider);
  final result = await usecase('', query);
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});
