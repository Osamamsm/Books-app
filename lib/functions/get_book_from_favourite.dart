import 'package:final_project/models/book_info.dart';

getFavouriteBook(List<dynamic> books) {
  List<BookInfo> favBooks = [];
  for (var book in books) {
    BookInfo favBook = BookInfo.fromMap(book);
    favBooks.add(favBook);
  }
  return favBooks;
}
