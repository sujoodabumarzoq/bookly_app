import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:flutter/material.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key, required this.books});
  final BookEntity books;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        IconButton(

          icon: const Icon(
            Icons.shopping_cart_outlined,
          ), onPressed: () {  },
        )
      ],
    );
  }
}
