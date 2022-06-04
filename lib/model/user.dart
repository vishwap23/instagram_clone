import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String bio;
  final List following;
  final List followers;

  const User(
      {required this.email,
      required this.uid,
      required this.username,
      required this.photoUrl,
      required this.bio,
      required this.followers,
      required this.following});

  Map<String, dynamic> toJson() => {
    "username": username,
    "uid": uid,
    "email":email,
    "photoUrl":photoUrl,
    "bio":bio,
    "follower":followers,
    "following":following
  };
  static User fromSnap(DocumentSnapshot snapshots){
    var snapshot = snapshots.data() as Map<String ,dynamic>;
    return User(
      username:  snapshot['username'],
      uid: snapshot['uid'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      bio: snapshot['bio'],
      followers: snapshot['followers'],
      following: snapshot['following']
    );

  }
}