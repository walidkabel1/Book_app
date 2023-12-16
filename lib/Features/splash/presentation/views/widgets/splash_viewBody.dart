import 'package:bookly_app/Features/splash/presentation/views/widgets/sliding_Text.dart';
import 'package:bookly_app/core/approuter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class splashviewbody extends StatefulWidget {
  const splashviewbody({super.key});

  @override
  State<splashviewbody> createState() => _splashviewbodyState();
}

class _splashviewbodyState extends State<splashviewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidinganimation;

  @override
  void initState() {
    initAnimationController();

    NavigateToHome();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(context).push(appRouter.kHomeView);
    });
  }

  void initAnimationController() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidinganimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    super.initState();
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Image.asset(
              "assets/sticker.webp",
            ),
          ),
        )),
        const SizedBox(
          height: 10,
        ),
        SlidingText(slidinganimation: slidinganimation),
      ],
    );
  }
}
