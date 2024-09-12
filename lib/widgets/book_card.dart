import 'package:final_project/models/book_info.dart';
import 'package:final_project/views/book_info_view.dart';
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  const BookCard({super.key, required this.book});

  final BookInfo book;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo[100],
      elevation: 20,
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image(
            image: NetworkImage(book.cover),
            height: 160,
            width: 100,
            fit: BoxFit.fill,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Title :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  book.title,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Author :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(book.author),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BookInfoView(book: book);
              }));
            },
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
            ),
          ),
        ),
      ]),
    );
  }
}
