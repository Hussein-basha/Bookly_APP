import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/manager/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDeatialsView extends StatefulWidget {
  const BookDeatialsView({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  State<BookDeatialsView> createState() => _BookDeatialsViewState();
}

class _BookDeatialsViewState extends State<BookDeatialsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: widget.bookModel.volumeInfo!.categories![0],
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BookDetailsViewBody(
        bookModel: widget.bookModel,
      )),
    );
  }
}
