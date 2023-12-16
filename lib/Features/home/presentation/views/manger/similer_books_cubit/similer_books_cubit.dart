import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchsimilerBooks({required String Qategory}) async {
    emit(SimilerBooksloading());
    var result = await homeRepo.fetchsimilerBooks(Qategory: Qategory);
    result.fold((failure) {
      emit(SimilerBooksfailure(failure.errMessage));
    }, (books) {
      emit(SimilerBookssucess(books));
    });
  }
}
