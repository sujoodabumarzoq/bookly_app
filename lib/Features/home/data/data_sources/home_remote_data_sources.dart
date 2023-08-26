import 'package:bookly_app/Features/home/data/model/book_model/item.dart';
import 'package:bookly_app/Features/home/domain/entites/entities.dart';
import 'package:bookly_app/network/api_base_helper.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();

  Future<List<BookEntity>> fetchNewestBooks();
}

// هنا من هدف اني اجلب البيانات مش اعمل اذا هو خطا اولا
// repo هو الي هيحدد اذا صح او خطا
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
 final ApiBaseHelper apiBaseHelper;

  HomeRemoteDataSourceImpl(this.apiBaseHelper);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async {
    var data= await apiBaseHelper.get("volumes?Filtering=free-ebooks&Sorting=newest &q=computer science");


        List<BookEntity> books = getBooksList(data);
        return books ;
  }


  @override
  Future<List<BookEntity>> fetchNewestBooks()async {
    var data= await apiBaseHelper.get("volumes?Filtering=free-ebooks&q=computer science");


    List<BookEntity> books = getBooksList(data);
    return books ;
  }

// هنا ينفذذ كل المطلوب منو في data remote

 List<BookEntity> getBooksList(data) {
   List<BookEntity> books = [];
   // مكان الايتم
   for(var bookmap in data["items"]){
     // هنا هيبعتلي اكتب
     // علشان اضيفو موب كتب
     //هيرجعلي كتب ماب
     books.add(Item.fromJson(bookmap) );
   }
   return books;
 }


}

