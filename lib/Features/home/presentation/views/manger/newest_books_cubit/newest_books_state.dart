part of 'newest_books_cubit.dart';

sealed class NewestBooksState extends Equatable {
  const NewestBooksState();

  @override
  List<Object> get props => [];
}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksloading extends NewestBooksState {}

final class NewestBookssucess extends NewestBooksState {
  final List<BookModel> books;
  const NewestBookssucess(this.books);
}

final class NewestBooksfailure extends NewestBooksState {
  final String errMessage;

  const NewestBooksfailure(this.errMessage);
}
