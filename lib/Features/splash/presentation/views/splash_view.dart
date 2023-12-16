import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/Features/splash/presentation/views/widgets/splash_viewBody.dart';
import 'package:bookly_app/core/api_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  var homeRepo = HomeRepoImpl(ApiService(Dio()));
  @override
  void initState() {
    homeRepo.fetchFeaturedBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: splashviewbody(),
    );
  }
}
