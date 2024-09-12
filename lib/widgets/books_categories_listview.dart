import 'package:final_project/widgets/book_categories_widget.dart';
import 'package:flutter/material.dart';

class BooksCategoriesListview extends StatelessWidget {
  const BooksCategoriesListview({super.key});
  final List<String> categories = const [
    'Science',
    'History',
    'Fiction',
    'Fantasy',
    'Fiction',
    'Biography',
    'Technology',
    'Health',
    'Travel',
    'Children\'s Books',
    'Mystery',
    'Romance'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          return BookCategoriesWidget(category: categories[index]);
        },
        itemCount: categories.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
