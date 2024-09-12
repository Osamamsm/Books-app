import 'package:dio/dio.dart';
import 'package:final_project/models/book_info.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future<List<BookInfo>> getBooksInfo({required String subject}) async {
    try {
      List<BookInfo> books = [];
      Response bookResponse = await dio.get(
          'https://www.googleapis.com/books/v1/volumes?q=subject:$subject&maxResults=20');

      Map<String, dynamic> jsonData = bookResponse.data;

      for (var book in jsonData['items']) {
        if (book['volumeInfo'].containsKey('title') &
            book['volumeInfo'].containsKey('authors') &
            book['volumeInfo'].containsKey('description') &
            book['volumeInfo'].containsKey('imageLinks') &
            book['volumeInfo'].containsKey('categories') &
            book['volumeInfo'].containsKey('publishedDate')) {
          BookInfo bookInfo = BookInfo.fromJson(book);
          books.add(bookInfo);
        } else {
          continue;
        }
      }
      return books;
    } on DioException catch (e) {
      throw Exception(e.response!.data['error']['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<BookInfo>> searchBook({required String title}) async {
    try {
      List<BookInfo> books = [];
      Response bookResponse = await dio.get(
          'https://www.googleapis.com/books/v1/volumes?q=intitle::$title&maxResults=20');

      Map<String, dynamic> jsonData = bookResponse.data;

      for (var book in jsonData['items']) {
        if (book['volumeInfo'].containsKey('title') &
            book['volumeInfo'].containsKey('authors') &
            book['volumeInfo'].containsKey('description') &
            book['volumeInfo'].containsKey('imageLinks') &
            book['volumeInfo'].containsKey('categories') &
            book['volumeInfo'].containsKey('publishedDate')) {
          BookInfo bookInfo = BookInfo.fromJson(book);
          books.add(bookInfo);
        } else {
          continue;
        }
      }
      return books;
    } on DioException catch (e) {
      throw Exception(e.response!.data['error']['message']);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
