import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/core/utils/funcation/url_launcher.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.books});
final BookEntity books;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children:  [
          Expanded(
              child: CustomButton(
            text: "\$${books.price.toString()}",
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          )),
          Expanded(
              child: CustomButton(
                onpressed: ()async{
                  LaunchUrl(context, books.previewLink??"");
                },
            fontSize: 16,
            text: 'Free Preview',
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),

            ),
          )),
        ],
      ),
    );
  }
}
