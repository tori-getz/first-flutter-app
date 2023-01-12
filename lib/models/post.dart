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

  factory PostList.fromJson(Map<String, dynamic> json) {
    var postsJson = json['posts'] as List;

    List<Post> posts = postsJson.map((i) => Post.fromJson(i)).toList();

    return PostList(
      posts,
      json['total'] as int,
      json['skip'] as int,
      json['limit'] as int,
    );
  }
}

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

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      userId: json['userId'] as int,
      reactions: json['reactions'] as int,
    );
  }
}
