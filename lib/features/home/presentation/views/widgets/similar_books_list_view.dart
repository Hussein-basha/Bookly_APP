import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/core/widgets/custom_widget_error.dart';
import 'package:bookly_app/features/home/presentation/manager/similar%20books%20cubit/similar_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pop();
                      GoRouter.of(context).push(
                        AppRouter.kbookDetailsView,
                        extra: state.books[index],
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        16,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: state.books[index].volumeInfo!.imageLinks
                                ?.thumbnail ??
                            '',
                        fit: BoxFit.fill,
                        placeholder: (context, url) =>
                            const CustomLoadingIndicator(),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
