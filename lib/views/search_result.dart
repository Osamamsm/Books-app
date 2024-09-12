import 'package:final_project/models/book_info.dart';
import 'package:final_project/widgets/books_cards_listview_builder.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key, required this.books, required this.title});
  final List<BookInfo> books;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          BooksCardsListviewBuilder(
            books: books,
          ),
        ],
      ),
    );
  }
}
