import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/details_listview.dart';
import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';

class RelatedBooks extends StatelessWidget {
  const RelatedBooks({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "You can also like",
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 16,
        ),
        Detailslistview(),
      ],
    );
  }
}
