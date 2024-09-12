import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/functions/get_book_from_favourite.dart';
import 'package:final_project/models/book_info.dart';
import 'package:final_project/widgets/books_cards_listview_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouriteBooks extends StatelessWidget {
  const FavouriteBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .get(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasData) {
              List books = snapshot.data!.get('Favorite Books');
              List<BookInfo> favBooks = getFavouriteBook(books);
              return Column(
                children: [
                  BooksCardsListviewBuilder(books: favBooks),
                ],
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error Loading Data'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
