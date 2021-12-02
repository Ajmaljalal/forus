import 'package:forus/models/user.dart';

class Post {
  final User user;
  final String text;
  final String? dateTime;
  final List<String> imageUrl;
  final String? videoUrl;
  final int likes;
  final int comments;
  final int shares;
  final bool? isReshared;
  final User? resharedBy;

  const Post({
    required this.user,
    required this.text,
    this.dateTime,
    required this.imageUrl,
    this.videoUrl = '',
    required this.likes,
    required this.comments,
    required this.shares,
    this.isReshared = false,
    this.resharedBy,
  });

  factory Post.fromJson(Map<String, dynamic> json, String id) => Post(
      user: json["user"],
      text: json["text"],
      dateTime: json["date"].toString(),
      comments: json["comments"],
      likes: json["likes"],
      isReshared: json["isReshared"],
      imageUrl: json["imageUrl"],
      shares: json["shares"],
      resharedBy: json["resharedBy"],
      videoUrl: json["videoUrl"]);

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "text": text,
        "dateTime": dateTime,
        "comments": comments,
        "likes": likes,
        "isReshared": isReshared,
        "imageUrl": imageUrl,
        "shares": shares,
        "resharedBy": resharedBy,
        "videoUrl": videoUrl,
      };
}
