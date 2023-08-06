import '../../../features/home/data/models/book_model/book_model.dart';

String getText(BookModel bookModel) {
  if (bookModel.volumeInfo!.previewLink == null) {
    return 'Not Available';
  } else {
    return 'Preview';
  }
}
