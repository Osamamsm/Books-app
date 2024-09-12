import 'package:final_project/models/book_info.dart';
import 'package:final_project/services/api_provider.dart';
import 'package:final_project/views/search_result.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onSubmitted: (value) async {
        List<BookInfo> books = await ApiProvider().searchBook(title: value);
        if (context.mounted) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SearchResult(books: books,title: value,);
          }));
        }
        searchController.clear();
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintStyle: const TextStyle(),
        hintText: 'Enter Title',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
