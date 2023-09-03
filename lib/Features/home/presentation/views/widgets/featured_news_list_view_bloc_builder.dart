import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/featured_books_cubit/featured_books_state.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/newset_books_cubit/newestbook_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/newset_books_cubit/newestbook_state.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//
// class FeaturedNewsListViewBlocBuilder extends StatelessWidget {
//    FeaturedNewsListViewBlocBuilder({
//     super.key, required this.books,
//   });
//    final List<BookEntity> books;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<NewestBooksCubit, NewestBooksState>(
//       builder: (context, state) {
//         if (state is NewestBooksSuccess) {
//           return BookListViewItem(books: state.books[index], );
//         //  books: state.books,
//         } else if (state is NewestBooksFailure) {
//           return Text(state.errMessage);
//         } else {
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }


class FeaturedNewsListViewBlocBuilder extends StatelessWidget {
  const FeaturedNewsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if(state is NewestBooksSuccess){
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: BookListViewItem(books: state.books[index]),
              );
            },
          );
        }
        else if(state is NewestBooksFailure){
        return Text(state.errMessage);
        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
