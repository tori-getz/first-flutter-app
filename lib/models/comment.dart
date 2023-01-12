import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentList {
  final List<Comment> comments;
  final int total;
  final int skip;
  final int limit;

  CommentList(
    this.comments,
    this.total,
    this.skip,
    this.limit,
  );

  factory CommentList.fromJson(Map<String, dynamic> json) =>
      _$CommentListFromJson(json);

  Map<String, dynamic> toJson() => _$CommentListToJson(this);
}

@JsonSerializable()
class Comment {
  final int id;
  final String body;
  final int postId;
  final CommentUser user;

  Comment({
    required this.id,
    required this.body,
    required this.postId,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class CommentUser {
  final int id;
  final String username;

  CommentUser({
    required this.id,
    required this.username,
  });

  factory CommentUser.fromJson(Map<String, dynamic> json) =>
      _$CommentUserFromJson(json);

  Map<String, dynamic> toJson() => _$CommentUserToJson(this);
}
