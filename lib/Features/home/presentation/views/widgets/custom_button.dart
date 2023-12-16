import 'package:bookly_app/core/styles.dart';
import 'package:flutter/material.dart';

class custom_button extends StatelessWidget {
  const custom_button({
    super.key,
    required this.text,
    required this.backgroundColor,
    this.onPressed,
    this.borderRadius,
  });
  final String text;
  final Color backgroundColor;
  final void Function()? onPressed;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              //     padding: const EdgeInsets.symmetric(vertical: 10),
              fixedSize: const Size.fromHeight(50),
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(12))),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styles.textStyle18bold,
          )),
    );
  }
}
