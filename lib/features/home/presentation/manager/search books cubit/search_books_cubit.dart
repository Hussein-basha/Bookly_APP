import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repos/home_repo.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());

  final HomeRepo homeRepo;

  Future<void> searchBooks() async {
    emit(SearchBooksLoading());
    var result = await homeRepo.searchBooks();
    result.fold(
      // Failure
      (l) {
        emit(SearchBooksFailure(l.errMessage));
      },
      // Books
      (r) {
        emit(SearchBooksSuccess(r));
      },
    );
  }
}
