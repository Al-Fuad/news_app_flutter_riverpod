import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';

class HomeEntity {
  final List<NewsEntity> topNews;
  final List<NewsEntity> technews;

  HomeEntity({
    required this.topNews,
    required this.technews,
  });
}
