import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String photoUrl;
  final String contents;
  final DocumentReference reference;

  Post.fromMap(Map<String, dynamic> map, {this.reference})
      : photoUrl = map['photoUrl'],
        contents = map['contents'];

  Post.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
