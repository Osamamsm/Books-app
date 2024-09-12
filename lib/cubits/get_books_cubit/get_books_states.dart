import 'package:final_project/models/book_info.dart';

class BooksState {}

class BooksInitial extends BooksState {}

class BooksLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<BookInfo> books;

  BooksLoaded({required this.books});
}

class BooksError extends BooksState {}
