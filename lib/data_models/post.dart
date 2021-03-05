import 'package:forus/data_models/user.dart';

class Post {
  final User user;
  final String text;
  final String dateTime;
  final String imageUrl;
  final int likes;
  final int comments;
  final int shares;

  const Post({
    required this.user,
    required this.text,
    required this.dateTime,
    required this.imageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}
