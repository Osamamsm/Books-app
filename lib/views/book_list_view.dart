import 'package:final_project/cubits/get_books_cubit/get_books_cubit.dart';
import 'package:final_project/cubits/get_books_cubit/get_books_states.dart';
import 'package:final_project/widgets/books_cards_listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListView extends StatelessWidget {
  const BookListView({super.key, required this.category});
final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: BlocBuilder<GetBooksCubit, BooksState>(builder: (context, state) {
        if (state is BooksLoaded) {
          return Column(
            children: [
              BooksCardsListviewBuilder(books: state.books),
            ],
          );
        }

        if (state is BooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text('Error Loading Books'),
          );
        }
      }),
    );
  }
}
