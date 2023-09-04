import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/Features/search/presentation/views/manger/featured_search_cubit/featured_books_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../home/presentation/views/widgets/best_seller_list_view_item.dart';
import '../manger/featured_search_cubit/featured_books_state.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
   const SearchResultListView({super.key});

  @override

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedSearchBooksCubit, FeaturedSearchBooksState>(
      builder: (context, state) {
        if (state is FeaturedSearchBooksSucces) {
          return ListView.builder(
            itemCount: state.books.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: BookListViewItem(
                  books: state.books[index],
                ),
              );
            },
          );
        } else if (state is FeaturedSearchBooksFailure) {
          return Text(state.errMessage);
        } else if (state is FeaturedSearchBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(
            child: Text('search for any book',style: Styles.textStyle20,),
          );
        }
      },
    );
  }
}