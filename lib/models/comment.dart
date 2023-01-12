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

  factory CommentList.fromJson(Map<String, dynamic> json) {
    var commentsJson = json['comments'] as List;

    List<Comment> comments =
        commentsJson.map((i) => Comment.fromJson(i)).toList();

    return CommentList(
      comments,
      json['total'] as int,
      json['skip'] as int,
      json['limit'] as int,
    );
  }
}

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

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] as int,
      body: json['body'] as String,
      postId: json['postId'] as int,
      user: CommentUser.fromJson(json['user']),
    );
  }
}

class CommentUser {
  final int id;
  final String username;

  CommentUser({
    required this.id,
    required this.username,
  });

  factory CommentUser.fromJson(Map<String, dynamic> json) {
    return CommentUser(
      id: json['id'] as int,
      username: json['username'] as String,
    );
  }
}
