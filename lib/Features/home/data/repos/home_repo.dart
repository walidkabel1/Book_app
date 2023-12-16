import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<failure, List<BookModel>>> fetchsimilerBooks(
      {required String Qategory});
}
