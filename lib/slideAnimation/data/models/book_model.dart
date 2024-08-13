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
    bookName: 'Quaid-i-Azam',
    authorName: 'Founder of Pakistan',
    image: 'assets/image1.png',
  ),
  Book(
    bookName: 'Allama Iqbal',
    authorName: 'Poet of the East',
    image: 'assets/image2.jpeg',
  ),
  Book(
    bookName: 'Sir Syed Ahmed Khan',
    authorName: 'Indian Muslim Reformer',
    image: 'assets/image3.jpeg',
  ),
  // Add more books here
];
