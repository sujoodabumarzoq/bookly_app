import 'package:bookly_app/Features/search/data/repos/search_repo_Imp.dart';
import 'package:bookly_app/Features/search/presentation/views/manger/featured_search_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly_app/core/utils/funcation/setup_service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: BlocProvider(
            create: (context) => FeaturedSearchBooksCubit(
                getIt.get<SearchRepoImpl>()
            ),
            child: const SearchViewBody(),
          )),
    );
  }
}