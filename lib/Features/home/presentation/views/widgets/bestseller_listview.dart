import 'package:bookly_app/Features/home/presentation/views/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/bestsellerlistview_item.dart';
import 'package:bookly_app/core/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class bestSellerListView extends StatelessWidget {
  const bestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBookssucess) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.books.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: bestsellerListviewItem(
                    bookModel: state.books[index],
                  ),
                );
              });
        } else if (state is NewestBooksfailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
