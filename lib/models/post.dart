import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class PostList {
  final List<Post> posts;
  final int total;
  final int skip;
  final int limit;

  PostList(
    this.posts,
    this.total,
    this.skip,
    this.limit,
  );

  factory PostList.fromJson(Map<String, dynamic> json) =>
      _$PostListFromJson(json);

  Map<String, dynamic> toJson() => _$PostListToJson(this);
}

@JsonSerializable()
class Post {
  final int id;
  final String title;
  final String body;
  final int userId;
  final int reactions;

  Post({
    required this.id,
    required this.title,
    required this.body,
    required this.userId,
    required this.reactions,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
