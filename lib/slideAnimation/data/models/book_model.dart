class Item {
  final String itemName;
  final String authorName;
  final String image;

  Item({
    required this.itemName,
    required this.authorName,
    required this.image,
  });
}

List<Item> ListItems = [
  Item(
    itemName: 'Quaid-i-Azam',
    authorName: 'Founder of Pakistan',
    image: 'assets/image1.png',
  ),
  Item(
    itemName: 'Allama Iqbal',
    authorName: 'Poet of the East',
    image: 'assets/image2.jpeg',
  ),
  Item(
    itemName: 'Sir Syed Ahmed Khan',
    authorName: 'Indian Muslim Reformer',
    image: 'assets/image3.jpeg',
  ),
  // Add more items here
];
