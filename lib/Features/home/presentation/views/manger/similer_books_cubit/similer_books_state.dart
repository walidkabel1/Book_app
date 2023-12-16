part of 'similer_books_cubit.dart';

sealed class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksInitial extends SimilerBooksState {}

final class SimilerBooksloading extends SimilerBooksState {}

final class SimilerBookssucess extends SimilerBooksState {
  final List<BookModel> books;
  const SimilerBookssucess(this.books);
}

final class SimilerBooksfailure extends SimilerBooksState {
  final String errMessage;
  const SimilerBooksfailure(this.errMessage);
}
