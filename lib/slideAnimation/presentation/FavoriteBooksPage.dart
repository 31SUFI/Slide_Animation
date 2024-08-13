import 'package:animated_slide/slideAnimation/data/models/book_model.dart';
import 'package:animated_slide/slideAnimation/services/book_removal.dart';
import 'package:animated_slide/slideAnimation/utils/page_navigation_arrows.dart';
import 'package:animated_slide/slideAnimation/utils/scroll_notifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import the arrow functionality

class FavoriteBooksPage extends StatefulWidget {
  @override
  _FavoriteBooksPageState createState() => _FavoriteBooksPageState();
}

class _FavoriteBooksPageState extends State<FavoriteBooksPage> {
  late final ScrollNotifier _scrollNotifier;
  late final BookRemoval _bookRemoval;
  final PageController _pageController = PageController();
  final ValueNotifier<double> _notifierScroll = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _scrollNotifier = ScrollNotifier(_pageController, _notifierScroll);
    _bookRemoval = BookRemoval(_removeBook);
    _scrollNotifier.addListener();
  }

  @override
  void dispose() {
    _scrollNotifier.removeListener();
    _pageController.dispose();
    super.dispose();
  }

  void _removeBook(int index) {
    setState(() {
      favoriteBooks.removeAt(index);
    });
  }

  void _previousPage() {
    if (_pageController.page! > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _nextPage() {
    if (_pageController.page! < favoriteBooks.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookHeight = size.height * 0.45;
    final bookWidth = size.width * 0.6;

    // Calculate vertical position for arrows
    final verticalPosition =
        (size.height - bookHeight) / 2 + bookHeight / 2 - 25;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Favorite Books ❤',
          style: GoogleFonts.merriweather(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/Bg.png",
              fit: BoxFit.fill,
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: favoriteBooks.length,
            itemBuilder: (context, index) {
              final book = favoriteBooks[index];

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: bookHeight,
                            width: bookWidth,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20,
                                  offset: Offset(5.0, 5.0),
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onLongPress: () {
                              _bookRemoval.showRemoveDialog(context, index);
                            },
                            child: Container(
                              height: bookHeight,
                              width: bookWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(book.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 90),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book.bookName,
                          style: GoogleFonts.merriweather(
                              fontSize: 25,
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "By ${book.authorName}",
                          style: GoogleFonts.merriweather(
                              fontSize: 15, color: Colors.redAccent),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
          PageNavigationArrows(
            onPreviousPage: _previousPage,
            onNextPage: _nextPage,
            verticalPosition: verticalPosition,
          ),
        ],
      ),
    );
  }
}
