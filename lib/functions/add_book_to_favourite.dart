import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/book_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> addBooksToFavorite(BookInfo newObject) async {
  await FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .update({
    'Favorite Books': FieldValue.arrayUnion([newObject.toMap()]),
  });
}