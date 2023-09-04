
import 'package:bookly_app/Features/home/presentation/views/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/featured_books_cubit/featured_books_state.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class SimilerBooksListView extends StatelessWidget {
  const SimilerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSucces) {
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  BookDetailsView(books: state.books[index])),
                  );
                },

                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomBookImage(
                      image: state.books[index].image ?? ''
                  ),
                )

                );
              },
            ),
          );
        }
        else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        }
        else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
