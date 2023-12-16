import 'package:bookly_app/Features/home/presentation/views/widgets/bestseller_listview.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/customappbar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/customlistview.dart';
import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        SliverToBoxAdapter(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          CustomAppBar(),
          CustomListView(),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Newest books",
              style: Styles.textStyle18,
            ),
          ),
        ])),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Expanded(child: bestSellerListView()),
          ),
        )
      ]),
    );
  }
}
