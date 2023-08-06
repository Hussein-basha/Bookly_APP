import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(context, String? url) async {
  if (url != null) {
    final Uri uri = Uri.parse(
      url,
    );
    if (await canLaunchUrl(uri)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          // elevation: 0.0,
          content: Text(
            'Launch Success',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      );

      await launchUrl(
        uri,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Cannot Launch $url',
            style: const TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      );
    }
  }
}
