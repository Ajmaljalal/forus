import 'package:forus/models/user.dart';

class Post {
  final User user;
  final String text;
  final String? dateTime;
  final List<String> imageUrl;
  final int likes;
  final int comments;
  final int shares;

  const Post({
    required this.user,
    required this.text,
    this.dateTime,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
