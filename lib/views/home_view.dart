import 'package:final_project/models/book_info.dart';
import 'package:final_project/services/api_provider.dart';
import 'package:final_project/widgets/books_cards_listview_builder.dart';
import 'package:final_project/widgets/search_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SearchWidget(),
          const SizedBox(
            height: 15,
          ),
          FutureBuilder(
            future: ApiProvider().getBooksInfo(subject: 'nonfiction'),
            builder:
                (BuildContext context, AsyncSnapshot<List<BookInfo>> snapshot) {
              if (snapshot.hasData) {
                return BooksCardsListviewBuilder(books: snapshot.data!);
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Error Loading Data'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
