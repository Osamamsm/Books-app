class BookInfo {
  final String title;
  final String author;
  final String description;
  final String cover;
  final String category;
  final String publishDate;

  BookInfo(
      {required this.title,
      required this.author,
      required this.description,
      required this.cover,
      required this.category,
      required this.publishDate});

  factory BookInfo.fromJson(json) {
    return BookInfo(
        title: json['volumeInfo']['title'],
        author: json['volumeInfo']['authors'][0],
        description: json['volumeInfo']['description'],
        cover: json['volumeInfo']['imageLinks']['thumbnail'],
        category: json['volumeInfo']['categories'][0],
        publishDate: json['volumeInfo']['publishedDate']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'description': description,
      'cover': cover,
      'category': category,
      'publishDate': publishDate
    };
  }

  factory BookInfo.fromMap(Map<String, dynamic> map) {
    return BookInfo(
        title: map['title'],
        author: map['author'],
        description: map['description'],
        category: map['category'],
        cover: map['cover'],
        publishDate: map['publishDate']);
  }
}
