class PostsModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  PostsModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostsModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  /// For API List Parsing (VERY IMPORTANT)
  static List<PostsModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((e) => PostsModel.fromJson(e)).toList();
  }
}
