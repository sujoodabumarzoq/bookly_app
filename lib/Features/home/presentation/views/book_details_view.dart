import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';


class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.books,
  });
  final BookEntity books;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}
class _BookDetailsViewState extends State<BookDetailsView> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(books: widget.books,),
      ),
    );
  }
}