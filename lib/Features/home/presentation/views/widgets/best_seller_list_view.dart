// import 'package:bookly_app/Features/home/domain/entites/entities.dart';
// import 'package:flutter/material.dart';
//
// import 'best_seller_list_view_item.dart';
//
//
// class BestSellerListView extends StatefulWidget {
//   const BestSellerListView({Key? key, required this.books})
//       : super(key: key);
//
//   final List<BookEntity> books;
//
//   @override
//   State<StatefulWidget> createState() => _BestSellerListViewState();
// }
//
// class _BestSellerListViewState extends State<BestSellerListView> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * .3,
//       child: ListView.builder(
//         itemCount: widget.books.length,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: BookListViewItem(books: widget.books[index]),
//           );
//         },
//       ),
//     );
//   }
// }