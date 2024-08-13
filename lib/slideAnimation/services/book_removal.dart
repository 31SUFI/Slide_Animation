// slide_animation/services/book_removal.dart
import 'package:flutter/material.dart';
//import 'package:slide_animation/slideAnimation/data/models/book_model.dart';

class BookRemoval {
  final Function(int index) removeBook;

  BookRemoval(this.removeBook);

  void showRemoveDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remove Book'),
          content: Text(
              'Are you sure you want to remove this book from your favorites?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                removeBook(index);
                Navigator.of(context).pop();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
