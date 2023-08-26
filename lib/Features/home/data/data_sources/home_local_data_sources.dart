import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/constants.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDataSource {
  List<BookEntity>fetchFeaturedBooks();

  List<BookEntity> fetchNewestBooks();
}
class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks() {
    // معي ال box الي في بيانات الي انامهتمة فيها
    var box = Hive.box <BookEntity>(kFeaturedBox);

 return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box <BookEntity>(kNewsBox);

    return box.values.toList();
  }

}
// ليش هنا ما في Future
//لان انا هكون حافظه هاذا البيانات مش هستنى تيجي