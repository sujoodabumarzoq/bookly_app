import 'package:bloc/bloc.dart';

import 'package:bookly_app/Features/search/domain/repos/search_repo.dart';
import 'package:bookly_app/Features/search/presentation/views/manger/featured_search_cubit/featured_books_state.dart';


class FeaturedSearchBooksCubit extends Cubit<FeaturedSearchBooksState> {
  FeaturedSearchBooksCubit(this.searchRepo) : super(FeaturedSearchBooksInitial());
// هيتعامل مع UsaCase
  final SearchRepo searchRepo;
  Future<void> getSearched({required  String string}) async {
      emit(FeaturedSearchBooksLoading());
      var data =await searchRepo.fetechSearchedBooks(string);
      emit(FeaturedSearchBooksPaginationLoading());


    data.fold((failure) {
        emit(FeaturedSearchBooksFailure(failure.message));
        emit(FeaturedSearchBooksPaginationFailure(failure.message));
    }, (books) {
      emit(FeaturedSearchBooksSucces(books));
    });
  }}

