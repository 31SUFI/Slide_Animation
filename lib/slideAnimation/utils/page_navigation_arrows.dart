import 'package:flutter/material.dart';

class PageNavigationArrows extends StatelessWidget {
  final VoidCallback onPreviousPage;
  final VoidCallback onNextPage;
  final double verticalPosition;

  const PageNavigationArrows({
    Key? key,
    required this.onPreviousPage,
    required this.onNextPage,
    required this.verticalPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: verticalPosition,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: onPreviousPage,
          ),
        ),
        Positioned(
          right: 0,
          top: verticalPosition,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            onPressed: onNextPage,
          ),
        ),
      ],
    );
  }
}
