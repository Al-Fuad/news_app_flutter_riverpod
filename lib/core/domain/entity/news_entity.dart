// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// A class representing a news entity with various attributes.
class NewsEntity {
  final String title;
  final String author;
  final String publishedAt;
  final String description;
  final String content;
  final String urlToImage;
  final String url;

  /// Constructs a [NewsEntity] with the given attributes.
  NewsEntity({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.author,
    required this.publishedAt,
    required this.content,
  });

  /// Converts the [NewsEntity] instance to a map.
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'author': author,
      'publishedAt': publishedAt,
      'description': description,
      'content': content,
      'urlToImage': urlToImage,
      'url': url,
    };
  }

  /// Creates a [NewsEntity] instance from a map.
  factory NewsEntity.fromMap(Map<String, dynamic> map) {
    return NewsEntity(
      title: map['title'] as String,
      author: map['author'] as String,
      publishedAt: map['publishedAt'] as String,
      description: map['description'] as String,
      content: map['content'] as String,
      urlToImage: map['urlToImage'] as String,
      url: map['url'] as String,
    );
  }

  /// Converts the [NewsEntity] instance to a JSON string.
  String toJson() => json.encode(toMap());

  /// Creates a [NewsEntity] instance from a JSON string.
  factory NewsEntity.fromJson(String source) => NewsEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
