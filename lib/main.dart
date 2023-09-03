import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_featured_books_usa_case.dart';
import 'package:bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/newset_books_cubit/newestbook_cubit.dart';
import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/funcation/setup_service_locator.dart';
import 'package:bookly_app/core/utils/simple_bloc_observer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewsBox);
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeaturedBooksCubit(
            FetchFeaturedBooksUsaCase(getIt.get<HomeRepoImpl>()),
          )..fetchFeaturedBooks();
        }),
        BlocProvider(create: (context) {
          return NewestBooksCubit(
            FetchFeaturedNewUsaCase(getIt.get<HomeRepoImpl>()),
          )..fetchNewestBooks();
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
