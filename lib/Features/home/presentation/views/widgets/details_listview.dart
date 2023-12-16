import 'package:bookly_app/Features/home/presentation/views/manger/similer_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/listview_item.dart';
import 'package:bookly_app/core/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Detailslistview extends StatelessWidget {
  const Detailslistview({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
        builder: (context, state) {
          if (state is SimilerBookssucess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomListViewItem(
                        bookModel: state.books[index],
                        imageUrl: state.books[index].volumeInfo?.imageLinks
                                ?.thumbnail ??
                            "",
                      ),
                    );
                  },
                ),
              ),
            );
          } else if (state is SimilerBooksfailure) {
            return CustomErrorWidget(
              errMessage: state.errMessage,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
