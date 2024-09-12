import 'package:final_project/models/book_info.dart';
import 'package:final_project/widgets/book_card.dart';
import 'package:flutter/material.dart';

class BooksCardsListviewBuilder extends StatelessWidget {
  const BooksCardsListviewBuilder({super.key, required this.books});
  final List<BookInfo> books;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return BookCard(book: books[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemCount: books.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
