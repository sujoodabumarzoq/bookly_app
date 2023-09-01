
import 'package:hive/hive.dart';
// adapter
//
part 'entities.g.dart';
@HiveType(typeId: 0)
class BookEntity {
@HiveField(0)
  final String? image;
@HiveField(1)

  final String title;
@HiveField(2)
  final String bookid;
@HiveField(3)

final String? authorName;
@HiveField(4)

  final num? price;
@HiveField(5)

  final String? rating;

  BookEntity(
      {required this.image,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating,
      required this.bookid});
}
