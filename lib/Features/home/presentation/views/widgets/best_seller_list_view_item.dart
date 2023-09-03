import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.books});
  final BookEntity  books;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(
              height: 125,
              child: Row(
                children: [
                  AspectRatio(
                    aspectRatio: 2.5 / 4,
                    child:CustomBookImage(image: books.image??'',)
                    //Image.asset(books.image??"")
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Text(
                             books.title??"",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Styles.textStyle20.copyWith(
                                fontFamily: kGtSectraFine,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                           Text(
                            books.authorName??"",
                            style: Styles.textStyle14,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Row(
                            children: [
                              Text(
                             "Free",
                                style: Styles.textStyle20.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              const BookRating(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
