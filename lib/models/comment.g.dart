// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentList _$CommentListFromJson(Map<String, dynamic> json) => CommentList(
      (json['comments'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
      json['skip'] as int,
      json['limit'] as int,
    );

Map<String, dynamic> _$CommentListToJson(CommentList instance) =>
    <String, dynamic>{
      'comments': instance.comments,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as int,
      body: json['body'] as String,
      postId: json['postId'] as int,
      user: CommentUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'body': instance.body,
      'postId': instance.postId,
      'user': instance.user,
    };

CommentUser _$CommentUserFromJson(Map<String, dynamic> json) => CommentUser(
      id: json['id'] as int,
      username: json['username'] as String,
    );

Map<String, dynamic> _$CommentUserToJson(CommentUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
    };
