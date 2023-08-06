import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.kbookDetailsView,
          extra: bookModel,
        );
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                16,
              ),
              child: AspectRatio(
                aspectRatio: 2.6 / 4,
                child: CustomBookImage(
                  imageUrl: bookModel.volumeInfo!.imageLinks?.thumbnail ?? '',
                ),
                // child: Container(
                //   height: MediaQuery.of(context).size.height * 0.25,
                //   width: 110,
                //   decoration: BoxDecoration(
                //     color: Colors.red,
                //     borderRadius: BorderRadius.circular(
                //       10.0,
                //     ),
                //     image: const DecorationImage(
                //       fit: BoxFit.fill,
                //       image: AssetImage(
                //         AssetsData.testImage,
                //       ),
                //     ),
                //   ),
                // ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo!.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      bookModel.volumeInfo!.authors?[0] ?? '',
                      maxLines: 2,
                      style: Styles.textStyle14,
                      // .copyWith(color: const Color(0xff707070))
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookModel.volumeInfo!.publishedDate ?? '1995',
                        count: bookModel.volumeInfo!.pageCount ?? 117,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
