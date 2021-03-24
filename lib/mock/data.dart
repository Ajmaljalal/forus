import 'package:forus/models/models.dart';

final User currentUser = User(
  name: 'Ajmal Jalal',
  imageUrl: 'https://i.pravatar.cc/100',
);

final List<User> onlineUsers = [
  User(
    name: 'David Brooks',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Jane Doe',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Matthew Hinkle',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Amy Smith',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Ed Morris',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Carolyn Duncan',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Paul Pinnock',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Elizabeth Wong',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'James Lathrop',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Jessie Samson',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'David Brooks',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Jane Doe',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Matthew Hinkle',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Amy Smith',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Ed Morris',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Carolyn Duncan',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Paul Pinnock',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Elizabeth Wong',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'James Lathrop',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
  User(
    name: 'Jessie Samson',
    imageUrl: 'https://i.pravatar.cc/100',
  ),
];

List<Post> posts = [
  Post(
    user: currentUser,
    text: 'Check out these cool puppers',
    dateTime: '58m',
    imageUrl: [
      'https://images.pexels.com/photos/6151691/pexels-photo-6151691.jpeg',
      'https://picsum.photos/id/3/680/400',
      'https://picsum.photos/id/30/680/400',
      'https://picsum.photos/id/13/680/400'
    ],
    likes: 1202,
    comments: 184,
    shares: 96,
  ),
  Post(
    user: onlineUsers[5],
    text:
        'Please enjoy this placeholder text: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    dateTime: '3hr',
    imageUrl: [
      'https://picsum.photos/id/7/680/400',
      'https://picsum.photos/id/3/680/400',
      'https://picsum.photos/id/30/680/400',
      'https://picsum.photos/id/13/680/400'
    ],
    likes: 683,
    comments: 79,
    shares: 18,
  ),
  Post(
    user: onlineUsers[4],
    text: 'This is a very good boi.',
    dateTime: '8hr',
    imageUrl: [
      'https://picsum.photos/id/6/680/400',
      'https://picsum.photos/id/7/680/400',
      'https://picsum.photos/id/3/680/400',
      'https://picsum.photos/id/30/680/400',
      'https://picsum.photos/id/13/680/400'
    ],
    likes: 894,
    comments: 201,
    shares: 27,
  ),
  Post(
    user: onlineUsers[3],
    text: 'Adventure 🏔',
    dateTime: '15hr',
    imageUrl: [
      'https://picsum.photos/id/23/680/400',
      'https://picsum.photos/id/6/680/400',
      'https://picsum.photos/id/7/680/400',
      'https://picsum.photos/id/3/680/400',
      'https://picsum.photos/id/30/680/400',
      'https://picsum.photos/id/13/680/400'
    ],
    likes: 722,
    comments: 183,
    shares: 42,
  ),
  Post(
    user: onlineUsers[0],
    text:
        'More placeholder text for the soul: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    dateTime: '1d',
    imageUrl: ['https://picsum.photos/id/54/680/800'],
    likes: 482,
    comments: 37,
    shares: 9,
  ),
  Post(
    user: onlineUsers[9],
    text: 'A classic.',
    dateTime: '1d',
    imageUrl: [
      'https://images.pexels.com/photos/6151691/pexels-photo-6151691.jpeg'
    ],
    likes: 1523,
    shares: 129,
    comments: 301,
  )
];
