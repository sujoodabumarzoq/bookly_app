// // import 'package:bookly_app/Features/home/domain/entites/entities.dart';
// // import 'package:flutter/material.dart';
// //
// // import 'best_seller_list_view_item.dart';
// //
// //
// // class BestSellerListView extends StatefulWidget {
// //   const BestSellerListView({Key? key, required this.books})
// //       : super(key: key);
// //
// //   final List<BookEntity> books;
// //
// //   @override
// //   State<StatefulWidget> createState() => _BestSellerListViewState();
// // }
// //
// // class _BestSellerListViewState extends State<BestSellerListView> {
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return SizedBox(
// //       height: MediaQuery.of(context).size.height * .3,
// //       child: ListView.builder(
// //         itemCount: widget.books.length,
// //         scrollDirection: Axis.horizontal,
// //         itemBuilder: (context, index) {
// //           return Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 8),
// //             child: BookListViewItem(books: widget.books[index]),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:bookly_app/Features/home/domain/entites/entities.dart';
// import 'package:bookly_app/Features/home/presentation/views/manger/featured_books_cubit/featured_books_cubit.dart';
// import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class BestSellerListView extends StatefulWidget {
//   const BestSellerListView({Key? key, required this.books})
//       : super(key: key);
//
//   final BookEntity books;
//
//   @override
//   State<StatefulWidget> createState() => _BestSellerListViewState();
// }
//
// class _BestSellerListViewState extends State<BestSellerListView> {
//   late final ScrollController _scrollController;
//
//   var nextPage = 1;
//   var isLoading = false;
//   late BookEntity books;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//   }
//
//   Future<void> _scrollListener() async {
//     var currentPositions = _scrollController.position.pixels;
//     var maxScrollLength = _scrollController.position.maxScrollExtent;
//     if (currentPositions >= 0.7 * maxScrollLength) {
//       if (!isLoading) {
//         isLoading = true;
//         await BlocProvider.of<FeaturedBooksCubit>(context)
//             .fetchFeaturedBooks(pageNumber: nextPage++);
//         isLoading = false;
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height * .3,
//       child: ListView.builder(
//         controller: _scrollController,
//         itemCount: 40,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child:BookListViewItem(books: books,)
//           );
//         },
//       ),
//     );
//   }
// }
