import 'package:final_project/cubits/get_books_cubit/get_books_states.dart';
import 'package:final_project/models/book_info.dart';
import 'package:final_project/services/api_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetBooksCubit extends Cubit<BooksState> {
  GetBooksCubit() : super(BooksInitial());

  getBooks({required String category}) async {
    emit(BooksLoading());
    try {
      List<BookInfo> books =
          await ApiProvider().getBooksInfo(subject: category);

      emit(BooksLoaded(books: books));
    } on Exception catch (e) {
      emit(BooksError());
      throw Exception(e.toString());
    }
  }
}
