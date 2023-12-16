import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';

class bookdetails extends StatelessWidget {
  const bookdetails({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          bookModel.volumeInfo?.title! ?? "",
          style: Styles.textStyle30,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          bookModel.volumeInfo?.authors.toString() ?? "",
          style: Styles.textStyle16,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_outlined,
              color: Colors.yellow,
            ),
            const SizedBox(
              width: 6.3,
            ),
            Text(
              bookModel.volumeInfo?.averageRating?.toString() ?? "0 Reviews",
              style: Styles.textStyle18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              (bookModel.volumeInfo?.ratingsCount?.toString() ??
                  " No Ratings "),
              style: Styles.textStyle16,
            )
          ],
        )
      ],
    );
  }
}
