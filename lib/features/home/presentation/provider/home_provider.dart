import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app_flutter_riverpod/features/home/data/datasources/home_remote_data_source_impl.dart';
import 'package:news_app_flutter_riverpod/features/home/data/repositories/home_repository_impl.dart';
import 'package:news_app_flutter_riverpod/features/home/domain/usecases/get_news.dart';

final homeRepositoryProvider = Provider<HomeRepositoryImpl>((ref) {
  return HomeRepositoryImpl(HomeRemoteDataSourceImpl());
});

final getHomeProvider = Provider<GetNews>((ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return GetNews(repository);
});

final homeProvider = FutureProvider((ref) async {
  final usecase = ref.watch(getHomeProvider);
  final result = await usecase();
  return result.fold(
    (failure) => throw Exception('Error fetching news'),
    (news) => news,
  );
});
