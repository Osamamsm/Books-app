import 'package:final_project/cubits/get_books_cubit/get_books_cubit.dart';
import 'package:final_project/views/book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCategoriesWidget extends StatelessWidget {
  const BookCategoriesWidget({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var book = BlocProvider.of<GetBooksCubit>(context);
        book.getBooks(category: category);
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BookListView(
            category: category,
          );
        }));
      },
      child: Center(
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(5)),
          child: Center(
              child: Text(
            category,
            style: const TextStyle(fontSize: 16),
          )),
        ),
      ),
    );
  }
}
