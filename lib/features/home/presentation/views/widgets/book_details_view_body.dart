import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

import 'books_two_button_action.dart';
import 'custom_book_details_app_bar.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: CustomBookDetailsAppBar(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.24),
                child: CustomBookImage(
                  imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? '',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                bookModel.volumeInfo!.title!,
                style: Styles.textStyle30.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 6,
              ),
              Opacity(
                opacity: 0.7,
                child: Text(
                  bookModel.volumeInfo!.authors?[0] ?? '',
                  maxLines: 2,
                  style: Styles.textStyle18.copyWith(
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BookRating(
                rating: bookModel.volumeInfo!.publishedDate ?? '1995',
                count: bookModel.volumeInfo!.pageCount ?? 117,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(
                height: 26,
              ),
              BooksAction(
                bookModel: bookModel,
              ),
              // Expanded
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle16
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const SimilarBooksListView(),
            ],
          ),
        ),
      ],
    );
  }
}
