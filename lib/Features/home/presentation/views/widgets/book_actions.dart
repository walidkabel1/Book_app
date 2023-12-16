// ignore_for_file: unused_local_variable

import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_button.dart';
import 'package:bookly_app/core/functions/customlaunchurl.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        custom_button(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12), topLeft: Radius.circular(12)),
            onPressed: () {
              launchCustomUrl(context, bookModel.volumeInfo?.previewLink ?? "");
            },
            text: "Free",
            backgroundColor: Colors.white.withOpacity(0.8)),
        custom_button(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(12),
                topRight: Radius.circular(12)),
            onPressed: () {
              launchCustomUrl(context, bookModel.volumeInfo?.previewLink ?? "");
            },
            text: "Preview",
            backgroundColor: Colors.orange.withOpacity(.9))
      ],
    );
  }
}
