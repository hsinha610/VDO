import 'package:flutter/material.dart';

class Video {
  String name;
  String channel;
  String views;
  String duration;
  DateTime uploadDateTime;
  String iconUrl;
  String imageUrl;
  bool liked;
  String videoUrl;

  Video({
    @required this.name,
    @required this.channel,
    @required this.views,
    @required this.duration,
    @required this.liked,
    @required this.imageUrl,
    @required this.videoUrl,
  });
}

var videoList = <Video>[
  Video(
      name: 'Ae Dil Hai Mushkil Title Track',
      channel: 'SonyMusic',
      views: '262M',
      duration: '5:01',
      liked: false,
      imageUrl: 'assets/images/1.jpg',
      videoUrl: 'https://youtu.be/6FURuLYrR_Q'),
  Video(
      name: 'TVF Pitchers Season 1 Trailer',
      channel: 'The Viral Fever',
      views: '2.6M',
      duration: '4:08',
      liked: false,
      imageUrl: 'assets/images/2.jpg',
      videoUrl: 'https://youtu.be/xcUHB9n8Kws'),
  Video(
      name: 'Rockstar Jukebox',
      channel: 'T-Series',
      views: '1.6M',
      duration: '43:54',
      liked: false,
      imageUrl: 'assets/images/3.jpg',
      videoUrl: 'https://youtu.be/cB-ZRijjIMY'),
  Video(
      name: 'Angamalay Diaries- Hindi',
      channel: 'SelectFlix',
      views: '1M',
      duration: '1:48:05',
      liked: false,
      imageUrl: 'assets/images/4.jpg',
      videoUrl: 'https://youtu.be/pCnHGQEWOHM'),
  Video(
      name: 'Aspirants Trailer',
      channel: 'The Viral Fever',
      views: '4.3M',
      duration: '3:08',
      liked: false,
      imageUrl: 'assets/images/5.jpg',
      videoUrl: 'https://youtu.be/ViOutJ0kuJY'),
];

class Comment {
  String user;
  String comment;

  Comment({this.user, this.comment});
}

var commentList = <Comment>[
  Comment(user: 'User 1', comment: 'Nice'),
  Comment(user: 'User 2', comment: 'Awesome'),
  Comment(user: 'User 3', comment: 'Great'),
];
