import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/listview_item.dart';
import 'package:flutter/material.dart';

class bookDetailsItem extends StatelessWidget {
  const bookDetailsItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: custombookimage(
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? "",
              )),
        ),
      ),
    );
  }
}
