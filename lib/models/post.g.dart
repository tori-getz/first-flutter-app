// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostList _$PostListFromJson(Map<String, dynamic> json) => PostList(
      (json['posts'] as List<dynamic>)
          .map((e) => Post.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
      json['skip'] as int,
      json['limit'] as int,
    );

Map<String, dynamic> _$PostListToJson(PostList instance) => <String, dynamic>{
      'posts': instance.posts,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as int,
      reactions: json['reactions'] as int,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'userId': instance.userId,
      'reactions': instance.reactions,
    };
