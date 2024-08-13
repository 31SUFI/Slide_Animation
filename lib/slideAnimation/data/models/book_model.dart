class Book {
  final String bookName;
  final String authorName;
  final String image;

  Book({
    required this.bookName,
    required this.authorName,
    required this.image,
  });
}

List<Book> favoriteBooks = [
  Book(
    bookName: 'person 1',
    authorName: 'Author One',
    image: 'assets/image1.png',
  ),
  Book(
    bookName: 'person 2',
    authorName: 'Author Two',
    image: 'assets/image2.jpeg',
  ),
  // Add more books here
];
