import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/manger/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/bookdetails_otem.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/bookdetailsappbar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/related_books.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class bookDetailsView extends StatefulWidget {
  const bookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  State<bookDetailsView> createState() => _bookDetailsViewState();
}

class _bookDetailsViewState extends State<bookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilerBooksCubit>(context).fetchsimilerBooks(
        Qategory: widget.bookModel.volumeInfo?.categories![0] ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const CustomDetailsAppBar(),
                    bookDetailsItem(bookModel: widget.bookModel),
                    bookdetails(bookModel: widget.bookModel),
                    const SizedBox(
                      height: 40,
                    ),
                    BookActions(bookModel: widget.bookModel),
                    const SizedBox(
                      height: 16,
                    ),
                    const Expanded(
                        child: SizedBox(
                      height: 50,
                    )),
                    RelatedBooks(bookModel: widget.bookModel),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
