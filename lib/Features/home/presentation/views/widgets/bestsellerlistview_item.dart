import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/core/approuter.dart';
import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class bestsellerListviewItem extends StatelessWidget {
  const bestsellerListviewItem({
    super.key,
    required this.bookModel,
    this.rating,
    this.count,
  });
  final BookModel bookModel;
  final num? rating;
  final int? count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context)
                .push(appRouter.kbookDetailsView, extra: bookModel);
          },
          child: SizedBox(
            height: 120,
            child: AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(
                            bookModel.volumeInfo?.imageLinks?.thumbnail ?? ""),
                        fit: BoxFit.fill),
                    color: Colors.red),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                bookModel.volumeInfo?.title.toString() ?? "",
                style: Styles.textStyle20,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                bookModel.volumeInfo?.authors![0] ?? "",
                style: Styles.textStyle16,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  const Text(
                    "Free",
                    style: Styles.textStyle18,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star_outlined,
                    color: Colors.yellow,
                  ),
                  const SizedBox(
                    width: 6.3,
                  ),
                  Text(
                    bookModel.volumeInfo?.averageRating?.toString() ?? "0",
                    style: Styles.textStyle18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    (bookModel.volumeInfo?.ratingsCount?.toString() ??
                        "(no rate)"),
                    style: Styles.textStyle16,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
