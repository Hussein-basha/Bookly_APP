import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        16,
      ),
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          placeholder: (context, url) => const CustomLoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
          ),
        ),
        // child: Container(
        //   height: MediaQuery.of(context).size.height * 0.25,
        //   width: 110,
        //   decoration: BoxDecoration(
        //     // color: Colors.red,
        //     borderRadius: BorderRadius.circular(
        //       16.0,
        //     ),
        //     image: DecorationImage(
        //       fit: BoxFit.fill,
        //       image: NetworkImage(
        //         imageUrl,
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
