import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_usa_case.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/featured_books_cubit/featured_books_state.dart';


class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
// هيتعامل مع UsaCase
  final FetchFeaturedBooksUsaCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    emit(FeaturedBooksLoading());
    //هنا بيرجع either صح وغلط
    var result = await featuredBooksUseCase.call(pageNumber);
    //fold :  بتاخد 2 طرق
    //1
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.message));
      //2
    }, (books) {
      emit(FeaturedBooksSucces(books));
    });
  }}
