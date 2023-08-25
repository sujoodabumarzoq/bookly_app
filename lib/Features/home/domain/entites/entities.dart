class BookEntity {
  final String? image;

  final String title;
  final String bookid;
  final String? authorName;
  final num? price;
  final String? rating;

  BookEntity(
      {required this.image,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating,
      required this.bookid});
}
