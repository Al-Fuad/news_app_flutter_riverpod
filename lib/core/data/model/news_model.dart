import 'package:news_app_flutter_riverpod/core/domain/entity/news_entity.dart';

/// A model class that extends [NewsEntity] to represent news data.
class NewsModel extends NewsEntity {
  /// Constructs a [NewsModel] with the given parameters.
  NewsModel({
    required super.title,
    required super.description,
    required super.urlToImage,
    required super.url,
    required super.author,
    required super.publishedAt,
    required super.content,
  });

  /// Creates a [NewsModel] instance from a JSON object.
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      urlToImage: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
      author: json['author'] ?? '',
      publishedAt: json['publishedAt'] ?? '',
      content: json['content'] ?? '',
    );
  }

  /// Creates a list of [NewsModel] instances from a list of JSON objects.
  static List<NewsModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => NewsModel.fromJson(json)).toList();
  }
}
