import 'package:final_project/functions/add_book_to_favourite.dart';
import 'package:final_project/models/book_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BookInfoView extends StatelessWidget {
  const BookInfoView({super.key, required this.book});
  final BookInfo book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: NetworkImage(book.cover),
                    width: 140,
                    height: 200,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Title :',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          book.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        const Text(
                          'Author :',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          book.author,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          'Published in :',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(book.publishDate,
                            style: const TextStyle(
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      addBooksToFavorite(book);
                       Fluttertoast.showToast(msg: 'Added to favourites');
                    },
                    icon: const Icon(
                      Icons.favorite,
                      size: 40,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
                child: Center(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      book.category,
                      style: const TextStyle(fontSize: 16),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Description :',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    book.description,
                    style: const TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
