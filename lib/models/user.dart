class User {
  final String name;
  final String imageUrl;

  const User({
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
      };
}
