part of 'featured_books_cubit.dart';

sealed class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksloading extends FeaturedBooksState {}

final class FeaturedBookssucess extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBookssucess(this.books);
}

final class FeaturedBooksfailure extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksfailure(this.errMessage);
}
