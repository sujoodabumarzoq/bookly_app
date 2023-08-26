import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:hive_flutter/adapters.dart';

void saveBooksData(List<BookEntity> books, String boxName ) {

  var box = Hive.box(boxName);
  box.addAll(books);
}
