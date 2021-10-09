class Post {
  final String title;
  final String content;
  final DateTime createAt;
  final String authorEmail;
  final String authorNickname;

  Post({
    required this.title,
    required this.content,
    required this.createAt,
    required this.authorEmail,
    required this.authorNickname,
  });

  get calculatedId => (authorEmail + '-' + createAt.toString());

  Post.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? 'null',
        content = json['content'] ?? 'null',
        createAt = json['createAt'].toDate(),
        authorEmail = json['authorEmail'] ?? 'null',
        authorNickname = json['authorNickname'] ?? 'null';

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'createAt': createAt,
        'authorEmail': authorEmail,
        'authorNickname': authorNickname,
      };
}
