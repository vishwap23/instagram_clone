import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final String postId;
  final  datePublished;
  final String postUrl;
  final String profileImage;
  final  likes;

  const Post(
      {required this.description,
      required this.uid,
      required this.username,
      required this.postUrl,
      required this.postId,
      required this.datePublished,
      required this.profileImage,
      required this.likes
      });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "description": description,
        "postId": postId,
        "datePublished": datePublished,
        "profileImage": profileImage,
        "likes": likes,
        "postUrl": postUrl,
      };

  static Post fromSnap(DocumentSnapshot snapshots) {
    var snapshot = snapshots.data() as Map<String, dynamic>;
    return Post(
      datePublished: snapshot['datePublished'],
      description: snapshot['description'],
      profileImage: snapshot['profileImage'],
      postId: snapshot['postId'],
      likes: snapshot['likes'],
      username: snapshot['username'],
      uid: snapshot['uid'],
      postUrl: snapshot['postUrl'],
    );
  }
}
