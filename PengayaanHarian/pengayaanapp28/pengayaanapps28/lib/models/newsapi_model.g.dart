// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsapi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopHeadlineModelImpl _$$TopHeadlineModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TopHeadlineModelImpl(
      status: json['status'] as String? ?? '',
      totalResults: (json['totalResults'] as num?)?.toInt() ?? 0,
      articles: (json['articles'] as List<dynamic>?)
              ?.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TopHeadlineModelImplToJson(
        _$TopHeadlineModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

_$ArticleModelImpl _$$ArticleModelImplFromJson(Map<String, dynamic> json) =>
    _$ArticleModelImpl(
      author: json['author'] as String? ?? "",
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      urlToImage: json['urlToImage'] as String? ?? "",
    );

Map<String, dynamic> _$$ArticleModelImplToJson(_$ArticleModelImpl instance) =>
    <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'urlToImage': instance.urlToImage,
    };
